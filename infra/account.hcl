# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "dapps-world"
  aws_account_id = "677160962006"
  #  aws_caller_arn = get_aws_caller_identity_arn()
  aws_profile = "dapps-world"
  name        = "dapps"
  project     = "dapps"
  # Allow users to access k8s over aws_auth config
  users = [
    # SRE
    "olaniyi.oshunbote",
    "shea.levy",
    "daniel.thagard",
    # TODO: Would be nice to autogenerate these
    "vault-github-employees-shlevy-admin-1675276763-1Llx839PFwXnsKIBx",
  ]
  domain = "dapps.aws.iohkdev.io"
}
