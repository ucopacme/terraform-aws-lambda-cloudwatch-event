variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
  type        = bool
}

variable "iam_role_name" {
  default = ""
}

variable "tags" {
  type = map
  default = {}

}

