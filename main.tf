provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

provider "google" {
  credentials = "${var.gcp_credentials}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"
}
