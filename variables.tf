/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#################################
### Cloud workflows variables ###
#################################

variable "project_id" {
  type        = string
  description = "Project ID for Cloud Workflows"
}

variable "zone" {
  type        = string
  description = "Zone where GCE instance is running eg. us-central1-b"
  #default     = "australia-southeast1-b"
}

variable "instance_labels" {
  type        = map
  description = "One or more Key Value pairs of instance label to target in map format eg. {\"environment\" = \"dev\"}"
  default = {
    "env" = "test"
  }
}

variable "region" {
  type        = string
  description = "Region for Cloud Workflows"
  default     = "us-central1"
}

variable "workflows_service_account" {
  type        = string
  description = "Account ID for Cloud Workflows Service Account"
  default     = "workflows-sa"
}

variable "workflows_name" {
  type        = string
  description = "Name for Cloud Workflows"
  default     = "Runcommand"
}