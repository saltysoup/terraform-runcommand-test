This demo uses OS guest policy and cloud workflows to execute a one time command (creates a dummy.txt in C:\) on a running GCE Windows instance.

## Usage Instructions

1. Create a new Windows GCE instance and assign a label (we will use this to target and assign a guest policy)
1. Edit `variables.tf` with your input including the label key/val pair and zone of the running instance
1. Deploy the cloud resources using `terraform apply`
1. Once resources has been provisioned, open [Cloud Workflows console](https://pantheon.corp.google.com/workflows/workflow/us-central1/) and execute the new workflow
1. This will result in :
  * Creation of a new temporary OS policy to run the inline powershell command within `templates/workflow.yaml`
  * Execution of powershell command to generate a dummy.txt file in C:\
  * Deletion of the temporary OS policy for clean up

Note: This should also work for Linux instances by editing the inline interpreter from `powershell` to `shell` in `templates/workflow.yaml`. See [API documentation](https://cloud.google.com/compute/docs/osconfig/rest/v1alpha/projects.locations.osPolicyAssignments/create)

