# Key Protect Instance
resource "ibm_resource_instance" "kms_instance" {
  count             = var.kms_provision && var.kms_service == "keyprotect" ? 1 : 0
  name              = var.kms_name
  service           = "kms"
  plan              = var.kms_plan
  resource_group_id = var.resource_group_id
  tags              = (var.kms_tags != null ? var.kms_tags : null)
  service_endpoints = (var.kms_service_endpoint == "private-only" ? "private" : "public-and-private")
  location          = var.kms_location
}

# HPCS Instance
resource "ibm_hpcs" "hpcs" {
  count                = var.kms_provision && var.kms_service == "hpcs" ? 1 : 0
  location             = var.kms_location
  name                 = var.kms_name
  plan                 = var.kms_plan
  units                = var.hpcs_units
  failover_units       = var.hpcs_failover_units
  service_endpoints    = var.kms_service_endpoint 
  revocation_threshold = var.hpcs_revocation_threshold
  signature_threshold  = var.hpcs_signature_threshold
  signature_server_url = var.hpcs_signature_server_url
  
  dynamic "admins" {
    for_each = var.hpcs_admins
    content {
      key = admins.value["key"]
      name = admins.value["name"]
      token = admins.value["token"]
    }
  }
}

# This is needed if no instances are provisioned
data "ibm_resource_instance" "kms_instance" {
  count             = var.kms_provision ? 0 : 1
  name              = var.kms_name
  location          = var.kms_location
  resource_group_id = var.resource_group_id
  service           = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
} 
