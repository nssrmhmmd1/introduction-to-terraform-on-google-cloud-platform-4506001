module "qa" {
  source       = "./modules/blog"
  project_id   = var.project_id
  region       = var.region
  app_name     = "QA Environment"
  network_name = "qa"
}

module "staging" {
  source       = "./modules/blog"
  project_id   = var.project_id
  region       = var.region
  app_name     = "Staging Environment"
  network_name = "staging"
}

module "prod" {
  source       = "./modules/blog"
  project_id   = var.project_id
  region       = var.region
  app_name     = "Production Environment"
  network_name = "prod"
}

