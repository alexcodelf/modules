# @label "K8s Number"
# @group "Basic"
variable "k8s_number" {
  description = "The number of kubernetes cluster."
  default     = 1
}

# @label "K8s Version"
# @group "Basic"
# @options ["1.26.3-aliyun.1", "1.24.6-aliyun.1", "1.22.15-aliyun.1"]
variable "k8s_version" {
  type = string
    description = "The version of kubernetes cluster."
    default     = "1.26.3-aliyun.1"
}

# @label "Available Zone"
# @group "Advanced"
variable "availability_zone" {
  type = list(string)
  description = "The availability zones of vswitches."
  default     = ["cn-hangzhou-b", "cn-hangzhou-e", "cn-hangzhou-f"]
}

# @label "VPC ID"
# @group "Advanced"
variable "vpc_id" {
  type = string
  description = "Existing vpc id used to create several vswitches and other resources."
  default     = ""
}

# @label "VPC CIDR"
# @group "Advanced"
variable "vpc_cidr" {
  type = string
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  default     = "10.0.0.0/8"
}

# leave it to empty then terraform will create several vswitches
# @label "VSwitch IDs"
# @group "Advanced"
variable "vswitch_ids" {
  description = "List of existing vswitch id."
  type        = list(string)
  default     = []
}

# @label "VSwitch CIDRs"
# @group "Advanced"
variable "vswitch_cidrs" {
  description = "List of cidr blocks used to create several new vswitches when 'vswitch_ids' is not specified."
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}


# @label "Nat Gateway"
# @group "Advanced"
variable "new_nat_gateway" {
  description = "Whether to create a new nat gateway. In this template, a new nat gateway will create a nat gateway, eip and server snat entries."
  default     = "true"
}

# @label "Master Instance Types"
# @group "Advanced"
variable "master_instance_types" {
  description = "The ecs instance types used to launch master nodes."
  default     = ["ecs.n4.xlarge", "ecs.n4.xlarge", "ecs.sn1ne.xlarge"]
}

# @label "Worker Instance Types"
# @group "Advanced"
variable "worker_instance_types" {
  description = "The ecs instance types used to launch worker nodes."
  default     = ["ecs.sn1ne.xlarge", "ecs.n4.xlarge"]
}

# options: between 24-28
# @label "Node CIDR Mask"
# @group "Advanced"
variable "node_cidr_mask" {
  description = "The node cidr block to specific how many pods can run on single node."
  default     = 24
}

# @label "Enable SSH"
# @group "Basic"
variable "enable_ssh" {
  description = "Enable login to the node through SSH."
  default     = true
}

# @label "Install Cloud Monitor"
# @group "Basic"
variable "install_cloud_monitor" {
  description = "Install cloud monitor agent on ECS."
  default     = true
}

# options: none|static
# @label "CPU Policy"
# @group "Advanced"
# @options ["none", "static"]
variable "cpu_policy" {
  description = "kubelet cpu policy.default: none."
  default     = "none"
}

# options: ipvs|iptables
# @label "Proxy Mode"
# @group "Advanced"
# @options ["ipvs", "iptables"]
variable "proxy_mode" {
  description = "Proxy mode is option of kube-proxy."
  default     = "ipvs"
}

# @label "Password"
# @group "Basic"
variable "password" {
  description = "The password of ECS instance."
  default     = "Just4Test"
}

# @label "Worker Number"
# @group "Basic"
variable "worker_number" {
  description = "The number of worker nodes in kubernetes cluster."
  default     = 4
}

# @label "Service CIDR"
# @group "Basic"
variable "service_cidr" {
  description = "The kubernetes service cidr block. It cannot be equals to vpc's or vswitch's or pod's and cannot be in them."
  default     = "172.21.0.0/20"
}


# @label "Terway VSwitch IDs"
# @group "Advanced"
variable "terway_vswitch_ids" {
  description = "List of existing vswitch ids for terway."
  type        = list(string)
  default     = []
}

# @label "Terway VSwitch CIDRs"
# @group "Advanced"
variable "terway_vswitch_cirds" {
  description = "List of cidr blocks used to create several new vswitches when 'terway_vswitch_ids' is not specified."
  type        = list(string)
  default     = ["10.4.0.0/16", "10.5.0.0/16", "10.6.0.0/16"]
}

# @label "Cluster Addons"
# @group "Advanced"
variable "cluster_addons" {
  type = list(object({
    name   = string
    config = string
  }))

  default = [
    {
      "name"   = "terway-eniip",
      "config" = "",
    },
    {
      "name"   = "flexvolume",
      "config" = "",
    },
    {
      "name"   = "alicloud-disk-controller",
      "config" = "",
    },
    {
      "name"   = "logtail-ds",
      "config" = "{\"IngressDashboardEnabled\":\"true\"}",
    },
    {
      "name"   = "nginx-ingress-controller",
      "config" = "{\"IngressSlbNetworkType\":\"internet\"}",
    }
  ]
}