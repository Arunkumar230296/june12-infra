module "network" {
  source = "../../modules/network"

  project_name = "june12"
  environment  = "dev"
  vpc_cidr     = "10.10.0.0/16"

  public_subnet_cidrs = [
    "10.10.1.0/24",
    "10.10.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.10.11.0/24",
    "10.10.12.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = "june12"
  environment  = "dev"
}
