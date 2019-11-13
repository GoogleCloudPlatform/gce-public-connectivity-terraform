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

variable "user_account" {
   type = "string"
   description = "GCP user account used to complete solution."
}

variable "billing_account" {
   type = "string"
   description = "GCP billing account number." 
}

variable "org_id" {
   type = "string"
   description = "GCP organization number."
}

variable "vpc_pid" {
   type = "string"
   description = "GCP project ID of the host project."
}

variable "region1" {
   type = "string"
   description = "GCP region where resources are created."
}

variable "zone1" {
   type = "string"
   description = "GCP zone in the var.region where resources are created."
}

variable "region2" {
   type = "string"
   description = "GCP region where resources are created."
}

variable "zone2" {
   type = "string"
   description = "GCP zone in the var.region where resources are created."
}
