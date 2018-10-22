module "js_lambda" {
  source = "./lambda"
  project_name = "kl-aws-lambda-js-example"
  file_name = "kl-aws-lambda-js-example-1.0.0-SNAPSHOT-js.zip"
  s3_bucket_name = "${aws_s3_bucket.lambda_code.id}"
  lambda_runtime = "nodejs6.10"
  lambda_handler = "main.handler"
  iam_role = "${aws_iam_role.lambda_exec.arn}"
}

