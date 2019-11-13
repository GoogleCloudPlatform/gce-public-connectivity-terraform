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

provider "google" {
  version     = "2.5.1"
  project     = "${var.vpc_pid}"
}

data "google_billing_account" "acct" {
  billing_account = "${var.billing_account}"
  open            = true
}

resource "google_project" "iap_connect_vpc" {
  name            = "IAP connect VPC project"
  project_id      = "${var.vpc_pid}"
  org_id          = "${var.org_id}"
  billing_account = "${data.google_billing_account.acct.id}"
}

resource "google_project_services" "iap_connect_vpc" {
  project    = "${google_project.iap_connect_vpc.project_id}"
  services   = [
    "bigquery-json.googleapis.com",
    "cloudapis.googleapis.com",
    "clouddebugger.googleapis.com",
    "cloudtrace.googleapis.com",
    "compute.googleapis.com",
    "datastore.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "servicemanagement.googleapis.com",
    "serviceusage.googleapis.com",
    "sql-component.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
  ]
}
