resource "aws_iam_user" "developer" {
  name = "developer"
  path = "/"
}

resource "aws_iam_access_key" "developer" {
  user = "${aws_iam_user.developer.name}"
}

data "template_file" "developer_v1" {
  template = "${file("${path.module}/policies/developer/policy_v1.json")}"
}

resource "aws_iam_user_policy" "developer" {
  name = "deverloper_v1"
  user = "${aws_iam_user.developer.name}"

  policy = "${data.template_file.developer_v1.rendered}"
}
