This demo uses OS guest policy and cloud workflows to execute a one time operation on a running GCE instance.

## Usage Instructions

1. Create a new Windows GCE instance and assign a label (we will use this to target and assign a guest policy)
2. Enable VM Manager by adding [instance level or project level metadata](https://cloud.google.com/compute/docs/manage-os#enable-metadata)
3. Edit `variables.tf` with your input including the label key/val pair and zone of the running instance
4. Edit `versions.tf` with your GCS bucket to set the backend config
5. Run `terraform init` and deploy the cloud resources using `terraform apply`
7. Once resources has been provisioned, open [Cloud Workflows console](https://pantheon.corp.google.com/workflows/workflow/us-central1/) and execute the new workflow
8. This will result in :
  * Creation of a new temporary OS policy to run the inline powershell command within `templates/workflow.yaml`
  * Execution of powershell command to generate a dummy.txt file in C:\
  * Deletion of the temporary OS policy for clean up
9. (Optional) To integration this capability with existing workflows, invoke the cloud workflows execution API as the hook for triggering in-guest scripts/commmands

Note: This should also work for Linux instances by editing the inline interpreter from `powershell` to `shell` in `templates/workflow.yaml`. See [API documentation](https://cloud.google.com/compute/docs/osconfig/rest/v1alpha/projects.locations.osPolicyAssignments/create)

