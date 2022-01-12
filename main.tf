resource "google_project" "my_project" {
  name                = var.name
  project_id          = "${var.project_id_prefix}-${random_string.random.result}"
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  auto_create_network = var.auto_create_network
}

resource "random_string" "random" {
  length           = 6
  special          = false
  lower            = false
  upper            = false
}

resource "google_project_service" "project" {
  for_each = toset(var.service_apis)
  project = google_project.my_project.id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy = true
}

resource "google_compute_shared_vpc_host_project" "host" {
  count = var.is_host_project ? 1 : 0
  project = google_project.my_project.project_id
}

resource "google_compute_shared_vpc_service_project" "service" {
  count = var.is_service_project ? 1 : 0
  host_project    = var.host_project_id
  service_project = google_project.my_project.project_id
}