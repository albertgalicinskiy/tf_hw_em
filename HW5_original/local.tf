locals {

  correct_full_name = var.name_surename == regexall("_", var.name_surename) ? var.name_surename : replace(var.name_surename, "_", "")

  stor_acc_name = "st${local.correct_full_name}${var.env}"
  stor_dev_name = "${ var.env == "dev" && length(local.stor_acc_name) > 18 ? format("st%s%s", "develop", var.env) : local.stor_acc_name }"
  stor_qa_name =  "${ var.env == "qa" && length(local.stor_acc_name) > 18 ? format("st%s%s", "test", var.env) : local.stor_acc_name }"


  key_vault_name ="kv-${local.correct_full_name}${var.env}"
  key_vault_dev_name = "${ var.env == "dev" && length(local.key_vault_name) > 18 ? format("kv-%s-%s", "develop", var.env) : local.key_vault_name }"
  key_vault_qa_name = "${ var.env == "qa" && length(local.key_vault_name) > 18 ? format("kv-%s-%s", "test", var.env) : local.key_vault_name }"


  # Tags for all resources
  common_tags = {
    "name_surname" = local.correct_full_name
    "Environment"  = var.env
  }
}
