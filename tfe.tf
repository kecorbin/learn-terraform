terraform {
  backend "remote" {
    organization = "kcorbin"

    workspaces {
      name = "learn-terraform"
    }
  }
}
