{% for resource in resource_list %}
##############################################
#     {{ resource }}
#############################################
module "{{ resource }}_lambda" {
  source        = "./lambda_module"
  description   = "{{ resource }} lambda function"
  function_name = "{{ resource }}1"
  handler       = "RTM.Services.{{ api }}.{{ resource }}.Lambda::RTM.Services.{{ api }}.{{ resource }}.Lambda.Function::FunctionHandler"
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = "example.zip"
  source_code   = "example.zip"
  source_arn    = "${aws_api_gateway_rest_api.{{ api }}-api.execution_arn}/*/*/*"
}

{% endfor %}
