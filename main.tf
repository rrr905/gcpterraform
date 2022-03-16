
provider "google" {
#credentials = file("")
#project = ""
region = "asia-south1"
zone = "asia-south1-c"
}

module "agent_policy_simple" {
  source     = "./../../modules/agent-policy"
  project_id = var.project_id
  policy_id  = "ops-agents-test-policy-simple"
  agent_rules = [
    {
      type               = "logging"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
    {
      type               = "metrics"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
  ]
  group_labels = [
    {
      env = "dev"
    #   app = "myproduct"
    }
  ]
  os_types = [
    {
      short_name = "ubuntu"
      version    = "20"
    },
  ]
}