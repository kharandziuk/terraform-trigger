data "archive_file" "init" {
  type        = "zip"
  source_dir = "data/"
  output_path = "tmp/data.zip"
}

resource "null_resource" "provision-builder" {
  triggers = {
    src_hash = "${data.archive_file.init.output_sha}"
  }

  provisioner "local-exec" {
    command = "echo Touché"
  }
}
