terraform {
  # local backend

}

# VARIABLES DEFINITIONS

variable "hello" {
  # references tfvars file
  type = string
}

variable "worlds" {
  type = list(string)
}

variable "worlds_map" {
  type = map(string)
}

variable "worlds_splat" {
  type = list
}

# OUTPUTS (SHOWN AFTER TERRAFORM APPLY)

output "using_vars" {
  value = "Hello ${var.hello}"
}

output "using_conditionals" {
  value = "Hello %{if var.hello == "idk" }Sergio%{else}you%{endif}"
}

output "ternary_op" {
  value = "Hello ${var.hello == "world" ? "Sergio" : "not Sergio"}"
}

output "for_loop" {
  value = [for i, w in var.worlds : format("%s with index %s", upper(w), upper(i))]
}

output "list_to_map" {
  value = {for i, w in var.worlds : i => upper(w)}
}

output "maps_iter" {
  value = [for k, v in var.worlds_map : format("%s is %s", upper(k), upper(v))]
}

output "using_splat" {
  value = var.worlds_splat[*].mars_name  # splat operator (*)
}