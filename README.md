# WIP: PfSense on Proxmox with Terraform

This repository contains a Terraform configuration to deploy a PfSense network on Proxmox.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) + [Packer](https://www.packer.io/downloads) installed
- A [Proxmox](https://www.proxmox.com/en/downloads) host with a reachable console
- A [pfSense](https://www.pfsense.org/download/) ISO file in the Proxmox datastore

## Setup

1. Clone this repository and navigate to the `pfSense` directory. Copy & rename the `credentials.pkrvars.hcl.example` file to `credentials.pkrvars.hcl`.

2. Fill in the `credentials.pkrvars.hcl` file the Proxmox host url (ex: `https://proxmox.local:8006`).

3. Open the shell of the Proxmox host and run the following commands to create the Terraform role, user and token:

```bash
pveum role add terraform-role -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Console VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
pveum user add terraform@pve terraform-role
pveum aclmod / -user terraform@pve -role terraform-role
pveum user token add terraform@pve terraform -expire 0 -privsep 0 -comment "Terraform token"
```

Note down the "full-tokenid" value from the output in the `pfSense/credentials.pkrvars.hcl` file as the `proxmox_token_user` variable.
Also fill in the `proxmox_token` variables with the generated token (in the value field of the output).

## Credits

- @jibaromar & @Regis-Loyaute for the [Packer code](https://github.com/Regis-Loyaute/pfsense-packer-proxmox) to build the pfSense template
