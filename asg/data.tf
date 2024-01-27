data "google_compute_image" "debian_9" {
  provider = google-beta

  family  = "debian-11"
  project = "debian-cloud"
}