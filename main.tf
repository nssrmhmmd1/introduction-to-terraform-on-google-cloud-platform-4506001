module "qa" {
source = "./modules/blog"
Project_ID = var.Project_ID
region = var.region
app_name = "qa-blog"
Network_name = "qa"

}

module "staging" {

source = "./modules/blog"
Project_ID = var.Project_ID
region = var.region
app_name = "staging-blog"
Network_name = "staging"

}

module "Prod" {
    
source = "./modules/blog"
Project_ID = var.Project_ID
region = var.region
app_name = "Prod-blog"
Network_name = "Prod"

}