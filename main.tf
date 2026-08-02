module "qa" {
source = "./modules/blog"
project_ID = var.project_ID
region = var.region
app_name = "qa-blog"
Network_name = "qa"

}

module "staging" {

source = "./modules/blog"
project_ID = var.project_ID
region = var.region
app_name = "staging-blog"
Network_name = "staging"

}

module "Prod" {
    
source = "./modules/blog"
project_ID = var.project_ID
region = var.region
app_name = "Prod-blog"
Network_name = "Prod"

}