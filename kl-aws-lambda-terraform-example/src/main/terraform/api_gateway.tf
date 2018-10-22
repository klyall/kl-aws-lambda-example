resource "aws_api_gateway_rest_api" "api" {
  name        = "kl-aws-lambda-example"
}

resource "aws_api_gateway_deployment" "api" {
  depends_on = [
    "aws_api_gateway_integration.java_example",
  ]

  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  stage_name  = "test"
}

output "base_url" {
  value = "${aws_api_gateway_deployment.api.invoke_url}"
}