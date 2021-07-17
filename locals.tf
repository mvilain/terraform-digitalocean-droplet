#--------------------------------------------------------------------------------
# locals.tf
#  map the digital ocean sizes to something more intuitive
#  map the region into something more intuitive
#--------------------------------------------------------------------------------

locals {
  sizes = {
    nano      = "s-1vcpu-1gb"
    micro     = "s-2vcpu-2gb"
    small     = "s-2vcpu-4gb"
    medium    = "s-4vcpu-8gb"
    compute2  = "c2"
    compute4  = "c4"
    memory    = "m-2vcpu-16gb"
    gen       = "g-2vcpu-8gb"
    gendisk   = "gd-2vcpu-8gb"
  }
}

locals {
  region = {
    amsterdam-2 = "ams2"
    amsterdam-3 = "ams3"
    bangalore-1 = "blr1"
    frankfurt-1 = "fra1"
    london      = "lon1"
    newyork-1   = "nyc1"
    newyork-2   = "nyc2"
    newyork-3   = "nyc3"
    francisco-1 = "sfo1"
    francisco-2 = "sfo2"
    francisco-3 = "sfo3"
    singapore-1 = "sgp1"
    toronto-1   = "tor1"
  }
}
