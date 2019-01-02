output developer_credentials {
  value = {
	  "access_key_is" = "${aws_iam_access_key.developer.id}"
	  "secret_access_key_is" = "${aws_iam_access_key.developer.id}"
  }
}
