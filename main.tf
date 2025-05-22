module "azure_infra" {
    source="./modules/azure_infra"

    ressource_name ="vartest1"
    name_prefix = var.name
    vnet_cidrs =["10.0.0.0/16"]
    subnet_cidrs =["10.0.0.0/24"]
    open_ports=["80", "443"]
    tags ={
        "env"="prod"
    }
}
