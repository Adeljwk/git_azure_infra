variable "ressource_name" {
    type = string
    default = "defaultvartest1"
    description = "description vartest1"
}

variable "name_prefix" {
    type = string
    description = "description vartest1"
}


variable "vnet_cidrs" {
    type = list(string)
    default = ["defaultvartest2"]
    description = "description vartest2"
}

variable "subnet_cidrs" {
    type = list(string)
    default = ["defaultvartest3"]
    description = "description vartest3"
}

variable "open_ports" {
    type = list(string)
    default = ["defaultvartest4"]
    description = "description vartest4"
}

variable "tags" {
    type = map(string)
    default = {"defaultvartest5"="valuedefaultvartest5"}
    description = "description vartest3"
}