output "role_arn" {
  value = join("",aws_iam_role.role.*.arn)

}
