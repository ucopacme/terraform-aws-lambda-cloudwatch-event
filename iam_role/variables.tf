variable "iam_role_name" {
  default = ""
}

variable "tags" {
  type = map
  default = {}

}

variable "enabled" {
  description = "to be or not to be"
  default     = true
  type        = bool
}
