output developer_credentials {
  value = {
	  "access_key_is" = "${aws_iam_access_key.developer.id}"
	  "secret_access_key_is" = "${aws_iam_access_key.developer.secret}"
  }
}

output developer_v2_credentials {
  value = {
	  "access_key_is" = "${aws_iam_access_key.developer_v2.id}"
	  "secret_access_key_is" = "${aws_iam_access_key.developer_v2.secret}"
  }
}

output default_mfa_policy {
  value = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

output developer_group_assume {
  value = "${data.aws_iam_policy_document.developer_group_assume.json}"
}
