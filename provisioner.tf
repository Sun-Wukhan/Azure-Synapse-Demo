resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "az synapse pipeline create --name example-pipeline --workspace-name example-workspace --file example.json"
  }
}



