# Azure Hardened Images

Testing hardened images on Azure.

```sh
mkdir .keys && ssh-keygen -f .keys/tmp_rsa
```

## Image types

https://www.youtube.com/watch?v=BuOa8AAPWwM

### CIS

https://www.cisecurity.org/cis-hardened-images/microsoft

[CIS Hardened Images on Ubuntu Linux Server LTS](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/center-for-internet-security-inc.cis-ubuntu?tab=Overview)

https://www.cisecurity.org/insights/blog/new-options-from-cis-for-stig-compliance


az vm image list -p center-for-internet-security-inc -f cis-ubuntu -s cis-ubuntulinux2404-l1-gen2 --all


### Canonical

[About Public Cloud Ubuntu Pro images](https://canonical-ubuntu-pro-client.readthedocs-hosted.com/en/v29/explanations/what_are_ubuntu_pro_cloud_instances.html)

https://azuremarketplace.microsoft.com/en-us/marketplace/apps/canonical.0001-com-ubuntu-pro-focal-fips

