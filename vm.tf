# Create Google Cloud VMs | vm.tf

# Create web server template
resource "google_compute_instance_template" "web_server" {
  name                 = "${var.app_name}-${var.app_environment}-web-server-template"
  description          = "This template is used to create web server instances running Apache"
  instance_description = "Web Server running Apache"
  can_ip_forward       = false
  machine_type         = "g1-small"
  tags                 = ["ssh","http"]

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1804-lts"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.private_subnet_1.name
  }

  lifecycle {
    create_before_destroy = true
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential apache2"
}