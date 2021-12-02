output "instance_info" {
   value =  (var.kms_provision && var.kms_service == "keyprotect" ?  ibm_resource_instance.kms_instance[0].guid : 
      (var.kms_provision && var.kms_service == "hpcs" ? ibm_hpcs.hpcs[0].guid : data.ibm_resource_instance.kms_instance[0].guid)) 
} 