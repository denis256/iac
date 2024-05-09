terraform {
  source = "${path_relative_from_include()}/../modules/github"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  github_owner = "msanavia"
  github_repositories = {
    advent-of-code = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      dependabot_enable      = true
      description            = "Advent of Code solutions."
      topics                 = ["advent-of-code", "python"]
      visibility             = "public"
    }
    entra-id-memberships-cloner = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      dependabot_enable      = true
      description            = "Shell script to clone memberships between 2 users or 2 groups"
      topics                 = ["entra-id", "shell"]
      visibility             = "public"
    }
    iac = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "Monorepo for Infrastructure as Code."
      topics                 = ["github", "terraform", "terragrunt"]
      visibility             = "public"
    }
    msanavia = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "GitHub Personal Profile"
      visibility             = "public"
    }
  }
}
