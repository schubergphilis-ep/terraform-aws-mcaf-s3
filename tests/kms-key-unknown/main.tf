# Test fixture: the KMS keys are created in the same configuration, so their ARNs are unknown during plan.
resource "aws_kms_key" "default" {
  #checkov:skip=CKV2_AWS_64: test fixture, the default key policy is fine
  enable_key_rotation = true
}

resource "aws_kms_key" "replica" {
  #checkov:skip=CKV2_AWS_64: test fixture, the default key policy is fine
  enable_key_rotation = true
}

module "s3" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name        = "unknown-kms-key"
  kms_key_arn = aws_kms_key.default.arn

  replication_configuration = {
    create_iam_role = true

    rules = {
      "1" = {
        id                       = "1"
        create_replica_kms_grant = true
        dest_bucket              = "arn:aws:s3:::destination-bucket"
        replica_kms_key_arn      = aws_kms_key.replica.arn
      }
    }
  }
}
