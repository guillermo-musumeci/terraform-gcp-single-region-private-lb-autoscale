# Load balancer variables | lb-managed-variables.tf

# maximum number of VMs for load balancer autoscale
variable "lb_max_replicas" {
  type        = string
  description = "Maximum number of VMs for autoscale"
  default     = "4"
}

# minimum number of VMs for load balancer autoscale
variable "lb_min_replicas" {
  type        = string
  description = "Minimum number of VMs for autoscale"
  default     = "1"
}

# number of seconds that the autoscaler should wait before it starts collecting information
variable "lb_cooldown_period" {
  type        = string
  description = "The number of seconds that the autoscaler should wait before it starts collecting information from a new instance"
  default     = "60"
}