terraform {

}

variable "str" {
  type    = string
  default = " hello,world "
}

variable "items" {
  type    = list
  default = [null, null, "", "last"]
}

variable "stuff" {
  type = map
  default = {
    "hello"   = "world",
    "goodbye" = "moon"
  }
}

output "str" {
  value = split(",", trim(var.str, " "))
}

output "replace" {
  value = replace(var.str, "world", "you!")
}

output "bcrypt" {
  value = bcrypt("skibidi")
}

output "coalesced_list" {
  value = coalesce(var.items...)  # similar to * on python, coalesce returns not null element
}

output "map_keys" {
  value = reverse(values(var.stuff))
}