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

resource "google_compute_instance" "www-1" {
  name                      = "www-1"
  machine_type              = "n1-standard-1"
  zone                      = "${var.zone1}"
  allow_stopping_for_update = "true"
  project                   = "${google_project.iap_connect_vpc.project_id}"

  tags = [
    "http-tag",
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOF
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www-1</h1></body></html>' | sudo tee /var/www/html/index.html
    EOF

  service_account {
    scopes = [
      "service-management",
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring-write",
      "service-control",
    ]
  }
  depends_on = [
    # The project's services must be set up before the
    # network is enabled as the compute API will not
    # be enabled and cause the setup to fail.
    "google_project_services.iap_connect_vpc",
  ]
}




resource "google_compute_instance" "www-2" {
  name                      = "www-2"
  machine_type              = "n1-standard-1"
  zone                      = "${var.zone1}"
  allow_stopping_for_update = "true"
  project                   = "${google_project.iap_connect_vpc.project_id}"

  tags = [
    "http-tag",
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOF
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www-2</h1></body></html>' | sudo tee /var/www/html/index.html
    EOF

  service_account {
    scopes = [
      "service-management",
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring-write",
      "service-control",
    ]
  }
  depends_on = [
    # The project's services must be set up before the
    # network is enabled as the compute API will not
    # be enabled and cause the setup to fail.
    "google_project_services.iap_connect_vpc",
  ]
}

resource "google_compute_instance" "www-3" {
  name                      = "www-3"
  machine_type              = "n1-standard-1"
  zone                      = "${var.zone2}"
  allow_stopping_for_update = "true"
  project                   = "${google_project.iap_connect_vpc.project_id}"

  tags = [
    "http-tag",
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOF
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www-3</h1></body></html>' | sudo tee /var/www/html/index.html
    EOF

  service_account {
    scopes = [
      "service-management",
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring-write",
      "service-control",
    ]
  }
  depends_on = [
    # The project's services must be set up before the
    # network is enabled as the compute API will not
    # be enabled and cause the setup to fail.
    "google_project_services.iap_connect_vpc",
  ]
}

resource "google_compute_instance" "www-4" {
  name                      = "www-4"
  machine_type              = "n1-standard-1"
  zone                      = "${var.zone2}"
  allow_stopping_for_update = "true"
  project                   = "${google_project.iap_connect_vpc.project_id}"

  tags = [
    "http-tag",
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOF
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www-4</h1></body></html>' | sudo tee /var/www/html/index.html
    EOF

  service_account {
    scopes = [
      "service-management",
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring-write",
      "service-control",
    ]
  }
  depends_on = [
    # The project's services must be set up before the
    # network is enabled as the compute API will not
    # be enabled and cause the setup to fail.
    "google_project_services.iap_connect_vpc",
  ]
}
