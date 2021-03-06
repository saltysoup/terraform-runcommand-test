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
  default     = "injae-sandbox-340804"
}

variable "zone" {
  type        = string
  description = "Zone where GCE instance is running eg. us-central1-b"
  default     = "australia-southeast1-b"
}

variable "remote_script_location" {
  type        = string
  description = "Path of remote powershell script to execute in VM eg. https://my-bucket/myScript.ps1"
  default     = "https://github.com/saltysoup/terraform-microsoft-on-gcp/raw/main/Active%20Directory/Managed%20AD/singlesignon/scripts/test.ps1"
}

variable "remote_script_sha256_checksum" {
  type        = string
  description = "SHA265 checksum value of remote script"
  default = "0071F5C5481BF2450E3BD35FFA1E0ED10CA75AFDC8CFE142B09E8BF09882301C"
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