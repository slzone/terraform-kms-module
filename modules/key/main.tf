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
  dynamic "policies" {
    for_each = length(keys(var.policies)) == 0 ? [] : [var.policies]

    content {
      dynamic "rotation" {
        for_each = length(keys(lookup(policies.value, "rotation", {}))) == 0 ? [] : [lookup(policies.value, "rotation", {})]

        content {
          interval_month = lookup(rotation.value, "interval_month", null)
        }
      }
      dynamic "dual_auth_delete" {
        for_each = length(keys(lookup(policies.value, "dual_auth_delete", {}))) == 0 ? [] : [lookup(policies.value, "dual_auth_delete", {})]
        content {
          enabled = lookup(dual_auth_delete.value, "enabled", null)
        }
      }
    }
  }
}