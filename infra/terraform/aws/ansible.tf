resource "local_file" "ansible_inventory" {

  filename = "../../ansible/inventory/hosts.ini"

  content = <<EOT
[bastion]
${aws_instance.bastion.public_ip}

[apps]
%{ for ip in aws_instance.private_app[*].private_ip ~}
${ip}
%{ endfor }

EOT
}