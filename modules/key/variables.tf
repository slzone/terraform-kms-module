
variable "instance_id" {
  description = "KMS instance id"
  type        = string
}
variable "key_name" {
  description = "Name of the Key"
  type        = string
}
variable "network_access_allowed" {
  description = "Endpoint type of the Key"
  type        = string
  default     = null
}
variable "standard_key_type" {
  description = "Determines if it is a standard key or not"
  default     = null
  type        = bool
}
variable "force_delete" {
  description = "Determines if it has to be force deleted"
  default     = null
  type        = bool
}
variable "encrypted_nonce" {
  description = "Encrypted_nonce of the Key"
  type        = string
  default     = null
}
variable "iv_value" {
  description = "Iv_value of the Key"
  type        = string
  default     = null
}
variable "key_material" {
  description = "key_material of the Key"
  type        = string
  default     = null
}
variable "expiration_date" {
  description = "Expiration_date of the Key"
  type        = string
  default     = null
}
variable "rotation" {
  description = "Rotaion policy"
  type        = any
  default     = []
}
variable "dual_auth_delete" {
  description = "Dual auth policy"
  type        = any
  default     = []
}
variable "key_alias" {
  type        = string
  default     = null
  description = "Name of Key alias that has to be created"
}
variable "key_ring_id" {
  type        = string
  default     = null
  description = "Key ring id that has to be created /  used in kms_key resource"
}
variable "create_key_ring" {
  default     = false
  type        = bool
  description = "If true, this module creates a key ring"
}