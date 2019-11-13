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

resource "google_compute_instance_group" "us-resources-w" {
  name        = "us-resources-w"
  zone        = "${var.zone1}"

  named_port {
    name = "http"
    port    = 80
  }

instances = [
    "${google_compute_instance.www-1.self_link}",
    "${google_compute_instance.www-2.self_link}",
  ]
}

resource "google_compute_instance_group" "europe-resources-w" {
  name        = "europe-resources-w"
  zone        = "${var.zone2}"

  named_port {
    name = "http"
    port    = "80"
  }

instances = [
    "${google_compute_instance.www-3.self_link}",
    "${google_compute_instance.www-4.self_link}",
  ]
}
