provider "google" {
  zone    = var.zone
  project = var.project_id  # Use variable for project
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  deletion_protection = true

  initial_node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 20
  }

  remove_default_node_pool = false
}
