resource "ibm_kms_key" "key" {
  instance_id     = var.instance_id
  key_name        = var.key_name
  standard_key    = (var.standard_key_type != null ? var.standard_key_type : false)
  force_delete    = (var.force_delete != null ? var.force_delete : true)
  endpoint_type   = (var.network_access_allowed != null ? var.network_access_allowed : "public")
  payload         = (var.key_material != null ? var.key_material : null)
  encrypted_nonce = (var.encrypted_nonce != null ? var.encrypted_nonce : null)
  iv_value        = (var.iv_value != null ? var.iv_value : null)
  expiration_date = (var.expiration_date != null ? var.expiration_date : null)
}

resource "ibm_kms_key_policies" "key_policy" {
  count         = var.rotation == [] && var.dual_auth_delete == [] ? 0 : 1
  instance_id   = var.instance_id
  key_id        = ibm_kms_key.key.key_id
  endpoint_type = (var.network_access_allowed != null ? var.network_access_allowed : "public")
  dynamic "rotation" {
    for_each = var.rotation
    content {
      interval_month = lookup(rotation.value, "interval_month", null)
    }
  }
  dynamic "dual_auth_delete" {
    for_each = var.dual_auth_delete
    content {
      enabled = lookup(dual_auth_delete.value, "enabled", null)
    }
  }
}

resource "ibm_kms_key_alias" "key_alias" {
  count         = var.key_alias != null ? 1 : 0
  instance_id   = var.instance_id
  alias         = var.key_alias
  key_id        = ibm_kms_key.key.key_id
  endpoint_type = (var.network_access_allowed != null ? var.network_access_allowed : "public")
}

resource "ibm_kms_key_rings" "key_ring" {
  count         = var.key_ring_id != null && var.create_key_ring ? 1 : 0
  instance_id   = var.instance_id
  key_ring_id   = var.key_ring_id
  endpoint_type = (var.network_access_allowed != null ? var.network_access_allowed : "public")
}