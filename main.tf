

data "archive_file" "DataSource" {
    type = "zip"
    source_dir  = "scripts"
    output_path = "outputs/PythonFun.py"
  }



  resource "aws_lambda_function" "this" {
    count = var.enabled ? 1 : 0
    filename = data.archive_file.DataSource.output_path
    source_code_hash = data.archive_file.DataSource.output_base64sha256
    function_name = var.function_name
    role          = var.role
    handler       = var.handler
    runtime       = "python3.8"
    timeout       = var.timeout
    description   = var.description
    tags          = var.tags
  }

resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda_Fun_StopEC2" {
  count = var.enabled ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.*.arn[0]
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.CloudWatch_rule.*.arn[0]

}

resource "aws_cloudwatch_event_rule" "CloudWatch_rule" {
  count = var.enabled ? 1 : 0
  name        = var.function_name
  description = var.description
  schedule_expression = var.schedule_expression
}
resource "aws_cloudwatch_event_target" "lambda_schedular_target" {
  count = var.enabled ? 1 : 0
  rule = aws_cloudwatch_event_rule.CloudWatch_rule.*.name[0]
  arn  = aws_lambda_function.this.*.arn[0]
}
