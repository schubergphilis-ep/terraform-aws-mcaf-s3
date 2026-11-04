provider "aws" {
  region = "eu-west-1"
}

# Replicates one prefix to a bucket in another account. The module creates the replication role and, because the
# bucket uses a KMS key, a KMS grant that lets the role decrypt the source objects. The destination bucket policy and
# replica KMS key policy in the other account must allow this role (see the `replication_role_arn` output).
module "cross_account_replication" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "reports"
  kms_key_arn = "arn:aws:kms:eu-west-1:111111111111:key/1234abcd-12ab-34cd-56ef-1234567890ab"

  replication_configuration = {
    create_iam_role = true

    rules = {
      "1" = {
        id                  = "reports"
        dest_account_id     = "222222222222"
        dest_bucket         = "arn:aws:s3:::datalake-bucket"
        replica_kms_key_arn = "arn:aws:kms:eu-west-1:222222222222:key/0b6d5b2e-7f3c-4f53-9a8e-3c1f8f0c1d2e"

        filter = {
          prefix = "reports/daily/"
        }

        source_selection_criteria = {
          sse_kms_encrypted_objects = true
        }
      }
    }
  }
}

output "replication_role_arn" {
  value = module.cross_account_replication.replication_role_arn
}
