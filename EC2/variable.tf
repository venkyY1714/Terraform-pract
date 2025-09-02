variable "key-name" {
  description = "giving the key name"
  type        = string
  default     = "eks"
}
variable "myinstype" {
  description = "passing the instance type"
  type        = string
  default     = "t2.micro"
}
variable "myaz" {
  description = "availibikty zone for instance"
  type        = string
  default     = "ap-south-1a"
}
