locals {
  account_id   = "${data.aws_caller_identity.current.account_id}"
  environments = ["dev", "qa", "test", "prod"]
}


data "aws_caller_identity" "current" {}