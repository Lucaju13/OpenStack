terraform {

  required_version = ">= 0.14.0"

 

  required_providers {

	openstack = {

  	source  = "terraform-provider-openstack/openstack"

  	version = "~> 1.53.0"

	}

  }

}

provider "openstack" {

  auth_url         	= "http://10.202.0.96:5000/v3"

  user_name        	= "lucaju13"

  password         	= "Luc@as20001306"

  tenant_id        	= "bd1b2ae663cb40778eb4121859943c45"

  tenant_name      	= "lucaju_proj"

  domain_name      	= "Default"

  region           	= "RegionOne"

}
resource "openstack_networking_network_v2" "network_terraform" {

  name       	= "network_terraform"

  admin_state_up = true

}

resource "openstack_networking_subnet_v2" "subnet_terraform" {

  network_id 	= openstack_networking_network_v2.network_terraform.id

  name       	= "subnet_terraform"

  cidr       	= "192.168.104.0/24"

  ip_version 	= 4

  gateway_ip 	= "192.168.104.254"

  enable_dhcp	= true

}

resource "openstack_networking_router_v2" "router_terraform" {

  name = "router_terraform"

  admin_state_up  	= true

  external_network_id = "ae1a855a-77b0-4b80-9e6a-4a5266fc7a6f"

}

resource "openstack_networking_router_interface_v2" "router_interface" {

  router_id = openstack_networking_router_v2.router_terraform.id

  subnet_id = openstack_networking_subnet_v2.subnet_terraform.id

}

resource "openstack_compute_instance_v2" "instance_terraform" {

  name        	= "instance-terraform"

  image_name  	= "debian-12"

  flavor_name 	= "m1.small"

  key_pair    	= "key"

  security_groups = ["default"]

  network {

	uuid = openstack_networking_network_v2.network_terraform.id

  }

}

resource "openstack_networking_floatingip_v2" "fip_1" {

  pool = "public"

}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {

  floating_ip = openstack_networking_floatingip_v2.fip_1.address

  instance_id = openstack_compute_instance_v2.instance_terraform.id
}
