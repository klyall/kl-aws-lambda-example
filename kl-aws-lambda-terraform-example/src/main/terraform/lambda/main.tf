locals {
  file_location = "../../../../${var.project_name}/target/"
  md5 = "${md5(file("${local.file_location}${var.file_name}"))}"
  s3_key = "${var.project_name}/${local.md5}/${var.file_name}"
}

resource "aws_s3_bucket_object" "lambda_code" {
  key     = "${local.s3_key}"
  bucket  = "${var.s3_bucket_name}"
  source  = "${local.file_location}${var.file_name}"
  etag    = "${local.md5}"
}

resource "aws_lambda_function" "get_message" {
  function_name     = "${var.project_name}"
  s3_bucket         = "${var.s3_bucket_name}"
  s3_key            = "${local.s3_key}"
  runtime           = "${var.lambda_runtime}"
  handler           = "${var.lambda_handler}"
  role              = "${var.iam_role}"

  depends_on    = ["aws_s3_bucket_object.lambda_code"]
}
