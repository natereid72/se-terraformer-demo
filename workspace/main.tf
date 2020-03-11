terraform {
  backend "s3" {}
}

provider "aws" {
  region  = "us-west-2"
  profile = "terraform"
}

variable "service_name" {
  default = "test"
}

resource "aws_ecs_task_definition" "${var.environment_name}" {
  family                = "service"
  container_definitions = "${file("../task-definitions/service.json")}"

  
}
