resource "google_compute_subnetwork" "vpc_subnet" {
  name                     = var.name
  description              = var.description
  ip_cidr_range            = var.cidr_range
  region                   = var.region
  network                  = var.network_id
  project                  = var.project
  private_ip_google_access = var.private_ip_google_access

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  dynamic "log_config" {
    for_each = var.enable_log_config == true ? [1] : []
    content {
      aggregation_interval = var.aggregation_interval
      flow_sampling        = var.flow_sampling
      metadata             = var.metadata
      metadata_fields      = var.metadata_fields
    }
  }
}