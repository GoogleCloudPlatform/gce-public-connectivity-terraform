/*
Copyright 2019 Google LLC
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    https://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#<!--* freshness: { owner: 'ttaggart@google.com' reviewed: '2019-10-01' } *-->

resource "google_compute_router" "nat-router-us-central1" {
  name    = "nat-router-us-central1"
  region  = "${var.region1}"
  network  = "default"
}

resource "google_compute_router" "nat-router-europe-west1" {
  name    = "nat-router-europe-west1"
  region  = "${var.region2}"
  network  = "default"

}


resource "google_compute_router_nat" "nat-config1" {
  name                               = "nat-config1"
  router                             = "${google_compute_router.nat-router-us-central1.name}"
  region                             = "${var.region1}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_router_nat" "nat-config2" {
  name                               = "nat-config2"
  router                             = "${google_compute_router.nat-router-europe-west1.name}"
  region                             = "${var.region2}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
