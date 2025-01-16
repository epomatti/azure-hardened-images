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

> [!NOTE]
> For some images, you must accept the terms for marketplace images. Check in the sections bellow for reference.

Adjust the images available by commenting/uncommenting the code blocks referring to the different image types. Options explained here are:

- CIS Ubuntu
- Canonical Ubuntu Pro

Make sure the terms have been accepted for required images before proceeding.

Now, create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

## Image types


## CIS

### Introduction

Check the [CIS Hardened Images on Microsoft Azure][1] for more information from CIS.

Form the Azure Marketplace image Ubuntu Linux Server LTS, visit the page at [CIS Hardened Images on Ubuntu Linux Server LTS][2].

CIS also provides STIG-compliant images, with additional information at the [CIS Cloud Security Resources for STIG Compliance][1].


### Accept the Terms

```sh
# Try with latest tag
az vm image terms accept --urn "center-for-internet-security-inc:cis-ubuntu:cis-ubuntulinux2404-l1-gen2:latest"

# If not present, use explicit version
az vm image terms accept --urn "center-for-internet-security-inc:cis-ubuntu:cis-ubuntulinux2404-l1-gen2:1.0.1"
```

### Check for Updates

```sh
az vm image list -p center-for-internet-security-inc -f cis-ubuntu -s cis-ubuntulinux2404-l1-gen2 --all
```

## Canonical

Information about Canonical Ubuntu Pro images can be found at [About Public Cloud Ubuntu Pro images][4].

And the Azure Marketplace options can be found at [Ubuntu 24.04 LTS - all plans including Ubuntu Pro][5].

### Check for Updates

```sh
az vm image list -p center-for-internet-security-inc -f cis-ubuntu -s cis-ubuntulinux2404-l1-gen2 --all
```

## Costs

https://www.youtube.com/watch?v=BuOa8AAPWwM


[1]: https://www.cisecurity.org/cis-hardened-images/microsoft
[2]: https://azuremarketplace.microsoft.com/en-us/marketplace/apps/center-for-internet-security-inc.cis-ubuntu?tab=Overview
[3]: https://www.cisecurity.org/insights/blog/new-options-from-cis-for-stig-compliance
[4]: https://canonical-ubuntu-pro-client.readthedocs-hosted.com/en/v29/explanations/what_are_ubuntu_pro_cloud_instances.html
[5]: https://azuremarketplace.microsoft.com/en-us/marketplace/apps/canonical.ubuntu-24_04-lts?tab=Overview
