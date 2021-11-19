#### Common Variables #####
variable "resource_group_id" {
   type = string
}

variable "kms_provision" {
   type = bool
   default = false
}

variable "kms_service" {
   type = string
   default = "keyprotect"
}

variable "kms_name" {
   type = string
}

variable "kms_plan" {
   type = string
   default = "standard"
}

variable "kms_location" {
   type = string
}

variable "kms_service_endpoint" {
   type = string
   default = "public-and-private"
}

variable "kms_tags" {
   type = list
   default = null
}

#### HPCS variables #####

variable "hpcs_admins" {
   type = list
   default = []
}

variable "hpcs_failover_units" {
   type = number
   default = null
}

variable "hpcs_revocation_threshold" {
   type = number
   default = 2
}

variable "hpcs_signature_server_url" {
   type = string
   default = null
}

variable "hpcs_signature_threshold" {
   type = number
   default = 2
}

variable "hpcs_units" {
   type = number
   default = 2
}
