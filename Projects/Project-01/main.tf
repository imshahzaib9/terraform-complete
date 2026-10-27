/* VPC  */

module "vpc" {
  source = "./modules/vpc-module"

  environment        = var.environment
  vpc_cidr          = var.vpc_cidr
  availability_zone = var.availability_zone
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  
}

/* Security Group  */

module "security_group" {
  environment = var.environment
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id

}
