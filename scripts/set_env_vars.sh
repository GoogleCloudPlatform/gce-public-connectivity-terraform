#!/bin/bash

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#<!--* freshness: { owner: 'ttaggart@google.com' reviewed: '2019-10-01' } *-->

# This script sets dynamic and sensitive Terraform variables as env variables.

# Run this script and validate the presence of TF_VAR_* variables before
# running the Terraform commands.


# Replace [YOUR-ORGANIZATION-NAME] in the command below with your organization
# name.
TF_VAR_org_id=$(gcloud organizations list \
  --filter="display_name=[YOUR-ORGANIZATION-NAME]" \
  --format="value(ID)")
export TF_VAR_org_id


TF_VAR_region1=us-west1
export TF_VAR_region1

TF_VAR_zone1=us-west1-b
export TF_VAR_zone1

TF_VAR_region2=europe-west1
export TF_VAR_region2

TF_VAR_zone2=europe-west1-b
export TF_VAR_zone2

TF_VAR_user_account=$(gcloud auth list \
  --filter=status:ACTIVE \
  --format="value(account)")
export TF_VAR_user_account

TF_VAR_billing_account=$(gcloud beta billing accounts list \
  | grep ${TF_VAR_user_account} \
  | awk '{print $1}')
export TF_VAR_billing_account

TF_VAR_vpc_pid=$(echo vpc-iap-connect-$(od -An -N4 -D /dev/random) \
  | sed 's/ //')
export TF_VAR_vpc_pid

env | grep TF_ > TF_ENV_VARS 
