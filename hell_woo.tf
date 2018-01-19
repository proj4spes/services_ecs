
provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  description = "The aws region to deploy"
  default     = "eu-west-1"
}

variable "cluster" {
  description = "The Cluster name to be used by service"
  
}
variable "name" {
  description = "The service/image  name"

}
variable "container_port" {
  description = "The hell-woo container port"
  default     = 80
}

variable "instances_count" {
  description = "The number of instaces in ASG /ECS cluster "
  default     = 3
}

variable "environment" {
  description = "The hell-woo container port"
  default     = "TEST"
}

module "hell_woo" {
  # this sources from the "stack//service" module
  source          = "../con-stack/stack/service_new"
  name            = "${var.name}"
  image           = "376128762854.dkr.ecr.eu-west-1.amazonaws.com/${var.name}"
  container_port  = "${var.container_port}"
  #environment     = "${module.stack.environment}"
  cluster         = "${var.cluster}"
  #iam_role        = "${module.stack.iam_role}"
  #log_bucket      = "${module.stack.log_bucket_id}"
   environment     = "${var.environment}"
  instances_count  = "${var.instances_count}"
}

