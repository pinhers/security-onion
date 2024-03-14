terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.56.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "2.3.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  access_key = "ASIAW3MD7KI5ZQODPT6P"
  secret_key = "S/nykX8oIX+cz7c2JbVjC5nq/RyyvwSFmn4r3wQL"
  token = "FwoGZXIvYXdzEH4aDN3/WLJYQaE7QNkxiSLAAQ7zutW8PjARneMq+ZbP6QXAShahks9WFxN4iaUIfidGmCQF+cVuda4vxwljI3BISv5cNTAVnTTLB/wCuJEOYFcT6g3RnSj/rw4qxK1IBflJ3Tp4l2IzLaxWrxs/1HjA+4Uj7EO4IqEqonWTOwW//ShtuUykzjOTM5V5+iML/NQ34LBnQBWvBCsTIZa731NmrAVzKyHk5hs8YjWBJ//i0i879bzI7nlnTB0TOGpgvAPRTbCsjuP84RaF8UwM+y3HMyj72suvBjItLp/mxkig3C85cdA9KNHVWQsmzIQYVLRSQhLiVngHfGiXewMFAa6rfCyUvkeT"

  profile = "vocareum"
}

provider "cloudinit" {
}

data "template_cloudinit_config" "config-onion" {
  gzip = false
  base64_encode = false

  part {
    filename     = var.update-fstab
    content_type = "text/x-shellscript"
    content      = data.template_file.fstab.rendered
  }

  part {
    filename = var.cloud-config-onion
    content_type = "text/x-shellscript"
    content = file(var.cloud-config-onion)
  }

  part {
    filename = var.config-onion
    content_type = "text/x-shellscript"
    content = file(var.config-onion)
  }

  part {
    filename = var.config-netplan
    content_type = "text/x-shellscript"
    content = file(var.config-netplan)
  }

  part {
    filename = var.config-NetworkMiner
    content_type = "text/x-shellscript"
    content = file(var.config-NetworkMiner)
  }
  part {
    filename = var.config-45-allow-colord
    content_type = "text/plain"
    content = file(var.config-45-allow-colord)
  }
}

data "template_cloudinit_config" "config-kali" {
  gzip = false
  base64_encode = false

  part {
    filename     = var.kali-change-password
    content_type = "text/x-shellscript"
    content      = data.template_file.kali-password.rendered
  }

  part {
    filename = var.cloud-config-kali
    content_type = "text/x-shellscript"
    content = file(var.cloud-config-kali)
  }

  part {
    filename = var.config-kali
    content_type = "text/x-shellscript"
    content = file(var.config-kali)
  }

  part {
    filename = var.config-NetworkMiner
    content_type = "text/x-shellscript"
    content = file(var.config-NetworkMiner)
  }

  part {
    filename = var.config-45-allow-colord
    content_type = "text/plain"
    content = file(var.config-45-allow-colord)
  }
}

data "template_cloudinit_config" "config-sift" {
  gzip = false
  base64_encode = false

  part {
    filename     = var.sift-change-password
    content_type = "text/x-shellscript"
    content      = data.template_file.sift-password.rendered
  }

  part {
    filename = var.cloud-config-sift
    content_type = "text/x-shellscript"
    content = file(var.cloud-config-sift)
  }

  part {
    filename = var.config-sift
    content_type = "text/x-shellscript"
    content = file(var.config-sift)
  }

  part {
    filename = var.config-NetworkMiner
    content_type = "text/x-shellscript"
    content = file(var.config-NetworkMiner)
  }

  part {
    filename = var.config-45-allow-colord
    content_type = "text/plain"
    content = file(var.config-45-allow-colord)
  }
}

data "template_cloudinit_config" "config-remnux" {
  gzip = false
  base64_encode = false

  part {
    filename     = var.remnux-change-password
    content_type = "text/x-shellscript"
    content      = data.template_file.remnux-password.rendered
  }

  part {
    filename = var.cloud-config-remnux
    content_type = "text/x-shellscript"
    content = file(var.cloud-config-remnux)
  }

  part {
    filename = var.config-remnux
    content_type = "text/x-shellscript"
    content = file(var.config-remnux)
  }

  part {
    filename = var.config-NetworkMiner
    content_type = "text/x-shellscript"
    content = file(var.config-NetworkMiner)
  }

  part {
    filename = var.config-45-allow-colord
    content_type = "text/plain"
    content = file(var.config-45-allow-colord)
  }
}