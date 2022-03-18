/**
 * Copyright 2021 Google LLC
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

################## HELPER RESOURCES ##################

resource "random_pet" "name" {
  length = 1
}

# Enable Workflows API
resource "google_project_service" "workflows" {
  project            = var.project_id
  service            = "workflows.googleapis.com"
  disable_on_destroy = false
}

# Enable OSConfig API
resource "google_project_service" "osconfig" {
  project            = var.project_id
  service            = "osconfig.googleapis.com"
  disable_on_destroy = false
}

# Create a service account for Workflows
module "service_accounts" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "~> 3.0"
  project_id = var.project_id
  prefix     = random_pet.name.id
  names      = ["${var.workflows_service_account}"]
  project_roles = [
    "${var.project_id}=>roles/osconfig.osPolicyAssignmentAdmin",
    "${var.project_id}=>roles/logging.logWriter",
    "${var.project_id}=>roles/iam.serviceAccountTokenCreator"
  ]
}

# Define and deploy a workflow
resource "google_workflows_workflow" "runcommand" {
  project         = var.project_id
  name            = "${var.workflows_name}-${random_pet.name.id}"
  region          = var.region
  description     = "A cloud workflow using OS guest policy to invoke remote operation on GCE"
  service_account = module.service_accounts.email
  # target instance labels
  for_each = var.instance_labels
  # Imported main workflow YAML file
  source_contents = templatefile("${path.module}/templates/workflow.yaml",
  {
    zone = var.zone,
    runcommand_name = "runcommand-${random_pet.name.id}"
    label_key = each.key
    label_value = each.value
    }
  )

  depends_on = [google_project_service.workflows]
}