resource "aws_api_gateway_resource" "js_example" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  parent_id   = "${aws_api_gateway_rest_api.api.root_resource_id}"
  path_part   = "js_example"
}

resource "aws_api_gateway_method" "js_example" {
  rest_api_id   = "${aws_api_gateway_rest_api.api.id}"
  resource_id   = "${aws_api_gateway_resource.js_example.id}"
  http_method   = "GET"
  authorization = "NONE"

  request_parameters = {
    "method.request.querystring.name" = false
  }
}

resource "aws_api_gateway_integration" "js_example" {
  rest_api_id             = "${aws_api_gateway_rest_api.api.id}"
  resource_id             = "${aws_api_gateway_resource.js_example.id}"
  http_method             = "${aws_api_gateway_method.js_example.http_method}"
  type                    = "AWS_PROXY"
  uri                     = "${module.js_lambda.lambda_invoke_arn}"
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "js_example_200" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.js_example.id}"
  http_method = "${aws_api_gateway_method.js_example.http_method}"
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "js_response_method_integration" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.js_example.id}"
  http_method = "${aws_api_gateway_method_response.js_example_200.http_method}"
  status_code = "${aws_api_gateway_method_response.js_example_200.status_code}"

  response_templates = {
    "application/json" = ""
  }
}

resource "aws_lambda_permission" "js_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${module.js_lambda.lambda_arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.api.id}/*/*/*"

  depends_on    = ["aws_api_gateway_rest_api.api", "aws_api_gateway_resource.js_example"]
}
