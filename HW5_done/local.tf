locals {

  correct_full_name = var.name_surename == regexall("_", var.name_surename) ? var.name_surename : replace(var.name_surename, "_", "")

  resource_name_prefix = "${ var.env == "qa" && length(local.correct_full_name) > 16 ? "test" : (var.env == "dev" && length(local.correct_full_name) > 16 ? "develop" : local.correct_full_name) }"

  # Tags for all resources
  common_tags = {
    "name_surname" = local.correct_full_name
    "Environment"  = var.env
  }
}
