module "java_lambda" {
  source = "./lambda"
  project_name = "kl-aws-lambda-java-example"
  file_name = "kl-aws-lambda-java-example-1.0.0-SNAPSHOT.jar"
  s3_bucket_name = "${aws_s3_bucket.lambda_code.id}"
  lambda_runtime = "java8"
  lambda_handler = "com.lyall.example.aws.lambda.MessageRequestHandler"
  iam_role = "${aws_iam_role.lambda_exec.arn}"
}
