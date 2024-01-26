resource "google_compute_network" "vpc" {
	name = "vpc"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "public_subnet_1" {
	name = "public-subnet1"
	ip_cidr_range = "10.0.1.0/24"
	network = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "public_subnet_2" {
	name = "public-subnet2"
	ip_cidr_range = "10.0.2.0/24"
	network = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "public_subnet_3" {
	name = "public-subnet3"
	ip_cidr_range = "10.0.3.0/24"
	network = google_compute_network.vpc.name
}