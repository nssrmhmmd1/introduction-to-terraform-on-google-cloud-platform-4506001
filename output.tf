output  "qa-ip" {

    value = module.qa.public_ip
}

output  "staging-ip" {

    value = module.staging.public_ip
}

output  "Prod-ip" {

    value = module.Prod.public_ip
}