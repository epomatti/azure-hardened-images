# Azure Hardened Images

Testing hardened images options on Azure.

## Setup

Start by creating the temporary keys for SSH authentication:

```sh
mkdir .keys && ssh-keygen -f .keys/tmp_rsa
```

Copy the variables file:

```sh
cp templates/local.auto.tfvars .auto.tfvars
```

Set the required values:

```terraform
subscription_id    = ""
allowed_public_ips = [""]
```

Adjust the images available by commenting/uncommenting the code blocks referring to the different image types.

Then, create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

## Image types

https://www.youtube.com/watch?v=BuOa8AAPWwM

## CIS

```sh
az vm image terms accept --urn "center-for-internet-security-inc:cis-ubuntu:cis-ubuntulinux2404-l1-gen2:latest"
```

https://www.cisecurity.org/cis-hardened-images/microsoft

[CIS Hardened Images on Ubuntu Linux Server LTS](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/center-for-internet-security-inc.cis-ubuntu?tab=Overview)

https://www.cisecurity.org/insights/blog/new-options-from-cis-for-stig-compliance


az vm image list -p center-for-internet-security-inc -f cis-ubuntu -s cis-ubuntulinux2404-l1-gen2 --all

### Costs




## Canonical

[About Public Cloud Ubuntu Pro images](https://canonical-ubuntu-pro-client.readthedocs-hosted.com/en/v29/explanations/what_are_ubuntu_pro_cloud_instances.html)

https://azuremarketplace.microsoft.com/en-us/marketplace/apps/canonical.0001-com-ubuntu-pro-focal-fips

