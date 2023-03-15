terraform{
    required_providers{
         null = {
            source = "hashicorp/null"
            version = "3.1.1"
        }
    }
}

provider "null" {}

locals{
    rgs = [
         { "alpha" = { "region" ="eastus"
                      "vnet" ="omega" }},
         {"bravo" = { "region" ="southindia"
                      "vnet" ="psi" }},
         { "charlie" = {"region" = "westus2"
                       "vnet" ="chi" }},
    ]
}

resource "null_resource" "dummy_rgs" {
[for var.i in local.rgs:
    local.rgs.value.region == "eastus" ? "SUCCESS" : "FAIL"
]
    
}

resource "null_resource" "dummy_vnets"{
    for_each = local.rgs
    triggers = {
        name = each.value.vnet
        region = each.value.region
    }
}

output "dummy_rgs" {
    value = null_resource.dummy_rgs
}

output "dummy_vnets"{
    value = null_resource.dummy_vnets
}
