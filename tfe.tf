terraform {
  backend "remote" {
    organization = "kcorbin"

    workspaces {
      name = "tf-learn"
    }
  }
}
