data "template_file" "example_file" {
  template = "${file("template/dev.json")}"
}