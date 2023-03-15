terraform {
  cloud {
    organization = "BogusOrg"

    workspaces {
      name = "my-example"
    }
  }
}
