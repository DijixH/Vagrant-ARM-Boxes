packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "fedora-35" {
  #iso_url = "https://download.fedoraproject.org/pub/fedora/linux/releases/35/Server/aarch64/iso/Fedora-Server-dvd-aarch64-35-1.2.iso"
  iso_checksum = "sha256:30175bbbab8ea56398b813d643d562948a66025e53d9c793e023098cb758ef2a"
  ssh_username      = "vagrant"
  ssh_password      = "vagrant"
  ssh_timeout       = "30m"
  shutdown_command  = "sudo shutdown -h now"
  guest_os_type     = "arm-fedora-64"
  disk_adapter_type = "nvme"
  version           = 19
  http_directory    = "http"
  boot_command = [
    "c",
    "linux /images/pxeboot/vmlinuz inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg",
    "<enter>",
    "initrd /images/pxeboot/initrd.img",
    "<enter>",
    "boot",
    "<enter><wait>"
  ]
  usb = true
  vmx_data = {
    "usb_xhci.present"     = "true",
    "ethernet0.virtualdev" = "e1000e"
  }
  memory           = 2048
  cpus             = 2
  disk_size        = 20000
  vm_name          = "Fedora 35 Server"
  output_directory = "output"
}

build {
  sources = ["sources.vmware-iso.fedora-35"]

  provisioner "shell" {
    scripts = [
      "add-key.sh",
      "vmware-cleanup.sh"
    ]
  }
}