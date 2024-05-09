locals {
  dependabot_enabled = {
    for k, v in var.github_repositories : k => v if v.dependabot_enable != false
  }
}
