output "lambda_arn" {
  value = "${aws_lambda_function.get_message.arn}"
}

output "lambda_invoke_arn" {
  value = "${aws_lambda_function.get_message.invoke_arn}"
}