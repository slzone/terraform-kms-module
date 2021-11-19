output "crn" {
   value = (var.kms_service == "hpcs" ? ibm_hpcs.hpcs[0].crn : ibm_resource_instance.kms_instance[0].id)
}

output "guid" {
   value = (var.kms_service == "hpcs" ? ibm_hpcs.hpcs[0].guid : ibm_resource_instance.kms_instance[0].guid)
}