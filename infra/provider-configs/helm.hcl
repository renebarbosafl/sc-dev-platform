locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  profile      = local.account_vars.locals.aws_profile
}

# Generate k8s addons provider block
generate "helm_provider" {
  path      = "helm_provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF

    provider "helm" {
      kubernetes {
        host                   = data.aws_eks_cluster.cluster.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
        exec {
          api_version = "client.authentication.k8s.io/v1beta1"
          command     = "aws"
          args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.id, "--profile", "${local.profile}"]
        }
      }
    }
  EOF
}