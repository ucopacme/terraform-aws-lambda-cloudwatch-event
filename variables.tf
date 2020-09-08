variable "role" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}


variable "function_name" {
  default = ""
}

variable "handler" {
  default = ""
}

variable "description" {
  default = ""
}

variable "tags" {
  type = map
  default = {}

}

# variable "cloudwatchrole_name" {
#   type = string
#   description = "(optional) describe your variable"
#   default = ""
# }

variable "schedule_expression" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "cloudwatchrole_description" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "timeout" {
  type = string
  description = "(optional) describe your variable"
  default = "420"
}

variable "enabled" {
  type = string
  description = "(optional) describe your variable"
  default ="true"
}