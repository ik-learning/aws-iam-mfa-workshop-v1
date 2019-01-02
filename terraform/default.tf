# data "aws_iam_policy_document" "assume_role_policy_mfa" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "sts:AssumeRole",
#     ]

#     principals {
#       type = "AWS"

#       identifiers = [
#         "arn:aws:iam::${local.account_id}:root",
#       ]
#     }

#     condition {
#       test     = "Bool"
#       variable = "aws:MultiFactorAuthPresent"

#       values = [
#         "true",
#       ]
#     }

#     condition {
#       test     = "StringEquals"
#       variable = "aws:PrincipalType"

#       values = [
#         "User",
#       ]
#     }
#   }
# }