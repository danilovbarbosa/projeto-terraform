variable "amis" {
  type = map

  default = {
        "us-east-1": "ami-02fe94dee086c0c37"
        "us-east-2": "ami-01aab85a5e4a5a0fe"

  }
}

variable "cdirs_acesso_remoto" {
  type = list

  default = [
      "187.110.103.88/32"
  ]
}