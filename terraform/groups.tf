resource "aws_iam_group" "developer" {
  name = "developer" #
}

resource "aws_iam_group_policy" "developer" {
  name  = "developer-group-policy"
  group = "${aws_iam_group.developer.id}"

  policy     = "${data.aws_iam_policy_document.developer_group_assume.json}"
  depends_on = ["aws_iam_group.developer"]
}

resource "aws_iam_role" "developer_v3" {
  name               = "developer-role-v3"
  description        = "The role to be assumed by the Developer Group"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"

  tags = {
    Description = "Administator Role with access to related policies"
  }
}

data "aws_iam_policy_document" "developer_group_assume" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "${aws_iam_role.developer_v3.arn}",
    ]
  }
}

# Policies
resource "aws_iam_policy" "developer_v3" {
  name        = "developer-group-policy"
  description = "Developer group Policy"
  policy      = "${data.template_file.developer_group.rendered}"
}

resource "aws_iam_role_policy_attachment" "admin_base_attach" {
  role       = "${aws_iam_role.developer_v3.name}"
  policy_arn = "${aws_iam_policy.developer_v3.arn}"
}

data "template_file" "developer_group" {
  template = "${file("${path.module}/policies/group/policy_v3.json")}"

  vars = {
    region     = "${var.region}"
    account_id = "${local.account_id}"
  }

}

resource "aws_iam_user" "developer_v2" {
  name = "developer_v2"
  path = "/"
}

resource "aws_iam_user_group_membership" "developer_v2" {
  user = "${aws_iam_user.developer_v2.name}"

  groups = [
    "${aws_iam_group.developer.name}",
  ]
}

resource "aws_iam_access_key" "developer_v2" {
  user = "${aws_iam_user.developer_v2.name}"
}
