resource "google_compute_autoscaler" "default" {
  provider = google-beta

  name   = "my-autoscaler"
  zone   = "us-central1-f"
  target = google_compute_instance_group_manager.default.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60
  }
}

resource "google_compute_instance_template" "default" {
  provider = google-beta

  name           = "my-instance-template"
  machine_type   = "e2-medium"
  can_ip_forward = false

  tags = ["foo", "bar"]

  disk {
    source_image = data.google_compute_image.debian_9.id
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }
service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_target_pool" "default" {
  provider = google-beta

  name = "my-target-pool"
}

resource "google_compute_instance_group_manager" "default" {
  provider = google-beta

  name = "my-igm"
  zone = "us-central1-f"

  version {
    instance_template = google_compute_instance_template.default.id
    name              = "primary"
  }

  target_pools       = [google_compute_target_pool.default.id]
  base_instance_name = "autoscaler-sample"
}

