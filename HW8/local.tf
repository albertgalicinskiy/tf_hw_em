locals {

  # used before hw8
  # correct_full_name = var.name_surename == regexall("_", var.name_surename) ? var.name_surename : replace(var.name_surename, "_", "")
  
  name_surename = format("${var.user_name}%s", "${var.user_surename}")
  correct_full_name = local.name_surename == regexall("_", local.name_surename) ? local.name_surename : replace(local.name_surename, "_", "")

  resource_name_prefix = var.env == "qa" && length(local.correct_full_name) > 16 ? "test" : (var.env == "dev" && length(local.correct_full_name) > 16 ? "develop" : local.correct_full_name)

  # Tags for all resources
  common_tags = {
    "name_surname" = local.correct_full_name
    "Environment"  = var.env
  }
}
