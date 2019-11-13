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

resource "google_compute_firewall" "http" {
  name          = "allow-lb-and-healthcheck"
  network       = "default"
  project       = "${google_project.iap_connect_vpc.project_id}"
  target_tags   = ["http-tag"]

  source_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16", 
  ]

  allow {
    protocol    = "tcp"
    ports       = ["80",]
  }
}

resource "google_compute_firewall" "allow-ssh-from-iap" {
  name          = "allow-ssh-from-iap"
  network       = "default"
  project       = "${google_project.iap_connect_vpc.project_id}"
  target_tags   = ["http-tag"]

  source_ranges = [
    "35.235.240.0/20", 
  ]

  allow {
    protocol    = "tcp"
    ports       = ["22",]
  }

  depends_on = [
    # The project's services must be set up before the
    # network is enabled as the compute API will not
    # be enabled and cause the setup to fail.
    "google_project_services.iap_connect_vpc",
  ]
}
