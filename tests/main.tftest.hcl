# Mock aws provider, otherwise Terraform tries to connect to the service API.
mock_provider "aws" {
  # Mock data.aws_region: we always want to return "eu-central-1" for our tests.
  mock_data "aws_region" {
    defaults = {
      region = "eu-central-1"
    }
  }

  # Mock data.aws_iam_policy_document: IAM resources reject the random string a mock returns by default.
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}

# The default test checks logic in module when using it's default values when creating a plan.
# Additional tests below check individual variables and changes to their defaults. Try not to
# create assertions for resource fields that reference just the variable.
run "default" {
  command = plan

  module {
    source = "./"
  }

  assert {
    condition     = aws_s3_bucket.default.region == "eu-central-1"
    error_message = "Expected S3 bucket region to be eu-central-1, got: ${aws_s3_bucket.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.default.region == "eu-central-1"
    error_message = "Expected S3 bucket ownership controls region to be eu-central-1, got: ${aws_s3_bucket_ownership_controls.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_policy.default.region == "eu-central-1"
    error_message = "Expected S3 bucket policy region to be eu-central-1, got: ${aws_s3_bucket_policy.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.default.region == "eu-central-1"
    error_message = "Expected S3 bucket public access block region to be eu-central-1, got: ${aws_s3_bucket_public_access_block.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_request_payment_configuration.default.region == "eu-central-1"
    error_message = "Expected S3 bucket request payment configuration region to be eu-central-1, got: ${aws_s3_bucket_request_payment_configuration.default.region}"
  }
}

# Test resources use the supplied region value.
# Without a specified region they should fall back to the aws_region data source (tested in default
# test).
run "region" {
  command = plan

  module {
    source = "./"
  }

  variables {
    region = "eu-west-1"
  }

  assert {
    condition     = aws_s3_bucket.default.region == "eu-west-1"
    error_message = "Expected S3 bucket region to be eu-west-1, got: ${aws_s3_bucket.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.default.region == "eu-west-1"
    error_message = "Expected S3 bucket ownership controls region to be eu-west-1, got: ${aws_s3_bucket_ownership_controls.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_policy.default.region == "eu-west-1"
    error_message = "Expected S3 bucket policy region to be eu-west-1, got: ${aws_s3_bucket_policy.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.default.region == "eu-west-1"
    error_message = "Expected S3 bucket public access block region to be eu-west-1, got: ${aws_s3_bucket_public_access_block.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_request_payment_configuration.default.region == "eu-west-1"
    error_message = "Expected S3 bucket request payment configuration region to be eu-west-1, got: ${aws_s3_bucket_request_payment_configuration.default.region}"
  }
}

# The Object Lock configuration enables Object Lock, so existing buckets can be locked too.
run "object_lock" {
  command = plan

  module {
    source = "./"
  }

  variables {
    object_lock_mode = "GOVERNANCE"
    object_lock_days = 1
  }

  assert {
    condition     = aws_s3_bucket_object_lock_configuration.default["create"].object_lock_enabled == "Enabled"
    error_message = "Expected the lock configuration to enable Object Lock, got: ${aws_s3_bucket_object_lock_configuration.default["create"].object_lock_enabled}"
  }
}

# Object Lock works only with versioning enabled: fail at plan, not at apply.
run "object_lock_without_versioning" {
  command = plan

  module {
    source = "./"
  }

  variables {
    versioning       = false
    object_lock_mode = "GOVERNANCE"
    object_lock_days = 1
  }

  expect_failures = [aws_s3_bucket_object_lock_configuration.default]
}

# Without replication_configuration nothing replication related is created.
run "replication_disabled" {
  command = plan

  module {
    source = "./"
  }

  assert {
    condition     = length(aws_s3_bucket_replication_configuration.default) == 0
    error_message = "Expected no replication configuration, got: ${length(aws_s3_bucket_replication_configuration.default)}"
  }

  assert {
    condition     = length(module.s3_replication_role) == 0 && length(aws_kms_grant.s3_replication) == 0
    error_message = "Expected no replication role and KMS grant"
  }

  assert {
    condition     = output.replication_role_arn == null
    error_message = "Expected no replication role ARN, got: ${coalesce(output.replication_role_arn, "null")}"
  }
}

# With an existing role the module creates no role or grant, and renders the rule like it did before the new rule
# fields were added.
run "replication_existing_role" {
  command = plan

  module {
    source = "./"
  }

  variables {
    kms_key_arn = "arn:aws:kms:eu-central-1:111111111111:key/1234abcd-12ab-34cd-56ef-1234567890ab"

    replication_configuration = {
      iam_role_arn = "arn:aws:iam::111111111111:role/replication-role"

      rules = {
        "1" = {
          id          = "1"
          dest_bucket = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  assert {
    condition     = length(module.s3_replication_role) == 0 && length(aws_kms_grant.s3_replication) == 0
    error_message = "Expected no replication role and KMS grant when iam_role_arn is passed"
  }

  assert {
    condition     = aws_s3_bucket_replication_configuration.default["create"].role == "arn:aws:iam::111111111111:role/replication-role"
    error_message = "Expected the replication configuration to use the passed role, got: ${aws_s3_bucket_replication_configuration.default["create"].role}"
  }

  assert {
    condition     = output.replication_role_arn == "arn:aws:iam::111111111111:role/replication-role"
    error_message = "Expected the passed role ARN as output, got: ${coalesce(output.replication_role_arn, "null")}"
  }

  assert {
    condition = (
      aws_s3_bucket_replication_configuration.default["create"].rule[0].delete_marker_replication[0].status == "Disabled" &&
      aws_s3_bucket_replication_configuration.default["create"].rule[0].destination[0].account == null &&
      length(aws_s3_bucket_replication_configuration.default["create"].rule[0].destination[0].access_control_translation) == 0 &&
      length(aws_s3_bucket_replication_configuration.default["create"].rule[0].filter) == 1 &&
      aws_s3_bucket_replication_configuration.default["create"].rule[0].filter[0].prefix == null
    )
    error_message = "Expected the default rule: delete markers disabled, no destination account or owner translation and an empty filter"
  }
}

# The module creates the role and a KMS grant for the bucket key, and renders the cross-account and prefix settings.
run "replication_managed_role" {
  command = plan

  module {
    source = "./"
  }

  # The role name derives from the bucket name, which is otherwise unknown during plan.
  override_resource {
    target          = aws_s3_bucket.default
    override_during = plan
    values = {
      id  = "a-bucket-name-that-is-exactly-sixty-three-characters-long-01234"
      arn = "arn:aws:s3:::a-bucket-name-that-is-exactly-sixty-three-characters-long-01234"
    }
  }

  variables {
    name        = "a-bucket-name-that-is-exactly-sixty-three-characters-long-01234"
    kms_key_arn = "arn:aws:kms:eu-central-1:111111111111:key/1234abcd-12ab-34cd-56ef-1234567890ab"

    replication_configuration = {
      create_iam_role = true

      rules = {
        "1" = {
          id                        = "reports"
          delete_marker_replication = true
          dest_account_id           = "222222222222"
          dest_bucket               = "arn:aws:s3:::destination-bucket"
          replica_kms_key_arn       = "arn:aws:kms:eu-central-1:222222222222:key/1234abcd-12ab-34cd-56ef-1234567890ab"

          filter = {
            prefix = "reports/daily/"
          }
        }
      }
    }
  }

  assert {
    condition     = length(module.s3_replication_role) == 1 && length(aws_kms_grant.s3_replication) == 1
    error_message = "Expected a replication role and only the KMS grant for the bucket key, not for the replica key in another account"
  }

  assert {
    condition     = length("${local.replication_iam_role_name}Role") <= 64
    error_message = "Expected the replication role name to fit in 64 characters, got: ${local.replication_iam_role_name}Role"
  }

  assert {
    condition     = aws_kms_grant.s3_replication["bucket"].operations == toset(["Decrypt"])
    error_message = "Expected the KMS grant to only allow Decrypt"
  }

  assert {
    condition = (
      aws_s3_bucket_replication_configuration.default["create"].rule[0].delete_marker_replication[0].status == "Enabled" &&
      aws_s3_bucket_replication_configuration.default["create"].rule[0].destination[0].account == "222222222222" &&
      aws_s3_bucket_replication_configuration.default["create"].rule[0].destination[0].access_control_translation[0].owner == "Destination" &&
      aws_s3_bucket_replication_configuration.default["create"].rule[0].filter[0].prefix == "reports/daily/"
    )
    error_message = "Expected delete markers, the destination account, owner translation and the prefix filter in the rule"
  }
}

# Without a bucket key there is nothing to grant, and the grant can be turned off when the key policy allows the role.
run "replication_managed_role_without_grant" {
  command = plan

  module {
    source = "./"
  }

  variables {
    kms_key_arn = "arn:aws:kms:eu-central-1:111111111111:key/1234abcd-12ab-34cd-56ef-1234567890ab"

    replication_configuration = {
      create_iam_role  = true
      create_kms_grant = false

      rules = {
        "1" = {
          id          = "1"
          dest_bucket = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  assert {
    condition     = length(module.s3_replication_role) == 1 && length(aws_kms_grant.s3_replication) == 0
    error_message = "Expected a replication role without KMS grant"
  }
}

run "replication_managed_role_without_kms_key" {
  command = plan

  module {
    source = "./"
  }

  variables {
    replication_configuration = {
      create_iam_role  = true
      create_kms_grant = false

      rules = {
        "1" = {
          id          = "1"
          dest_bucket = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  assert {
    condition     = length(module.s3_replication_role) == 1 && length(aws_kms_grant.s3_replication) == 0
    error_message = "Expected a replication role without KMS grant"
  }
}

# Replicas encrypted with a key in this account get their own grant, in the region of that key.
run "replication_same_account_replica_key" {
  command = plan

  module {
    source = "./"
  }

  variables {
    kms_key_arn = "arn:aws:kms:eu-central-1:111111111111:key/1234abcd-12ab-34cd-56ef-1234567890ab"

    replication_configuration = {
      create_iam_role = true

      rules = {
        "1" = {
          id                  = "1"
          dest_bucket         = "arn:aws:s3:::destination-bucket"
          replica_kms_key_arn = "arn:aws:kms:eu-west-1:111111111111:key/0b6d5b2e-7f3c-4f53-9a8e-3c1f8f0c1d2e"
        }
      }
    }
  }

  assert {
    condition = (
      length(aws_kms_grant.s3_replication) == 2 &&
      aws_kms_grant.s3_replication["replica-1"].region == "eu-west-1" &&
      aws_kms_grant.s3_replication["replica-1"].operations == toset(["Encrypt", "GenerateDataKey"])
    )
    error_message = "Expected a KMS grant for Encrypt and GenerateDataKey on the replica key in eu-west-1"
  }
}

# A KMS key created in the same configuration is unknown during plan, which must not block the grant.
run "replication_unknown_kms_key" {
  command = plan

  module {
    source = "./tests/kms-key-unknown"
  }
}

# A role must come from exactly one place.
run "replication_role_conflict" {
  command = plan

  module {
    source = "./"
  }

  variables {
    replication_configuration = {
      create_iam_role = true
      iam_role_arn    = "arn:aws:iam::111111111111:role/replication-role"

      rules = {
        "1" = {
          id          = "1"
          dest_bucket = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  expect_failures = [var.replication_configuration]
}

run "replication_role_missing" {
  command = plan

  module {
    source = "./"
  }

  variables {
    replication_configuration = {
      rules = {
        "1" = {
          id          = "1"
          dest_bucket = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  expect_failures = [var.replication_configuration]
}

run "replication_invalid_account_id" {
  command = plan

  module {
    source = "./"
  }

  variables {
    replication_configuration = {
      create_iam_role = true

      rules = {
        "1" = {
          id              = "1"
          dest_account_id = "2222"
          dest_bucket     = "arn:aws:s3:::destination-bucket"
        }
      }
    }
  }

  expect_failures = [var.replication_configuration]
}
