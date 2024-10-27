# Dev VMs

## About
The purpose of this directory is to document a collection of Dev VM's that I use for various development projects. 

These Dev VM's are meant as a series of building blocks to efficiently support a variety of development environments while maximizing efficiency by using linked cloning. Linked cloning technology allows for efficient memory layering, for example, I can create one base ubuntu install vm, and then create multiple linked clones from the base vm that all share the same base OS files, where only the modified or added files are saved for each separate linked clone.

The same memory layering capability in linked clones works even better in containers than in VM's, and so its better to use containers for creating separate environments. However, depending on the needs of the project, there are times when different VM's are needed. When a new environment is needed, use an existing dev VM with a new container when possible, and only create additional VM's if needed.

Currently, I don't have many Dev VM's and will document the manifests for each within this readme until I have a large enough quantity to create additional files or assets to document them. This directory will be used for this purpose.

## Current Dev VMs

- Name: Ubuntu 24.04 Server - Fresh Install
- Name: Ubuntu 24.04 Desktop - Fresh Install
 
## Manifests

### Ubuntu 24.04 Server - Fresh Install
- Description:
  - Fresh Install of Ubuntu 24.04 server with `apt update`command executed after install and no further configuration.
- Root_VM: True
- Configuration:
  - Username: afewell
  - Password: redacted
  - Language: English
  - Time_Zone: PST - Los Angeles
 
### Ubuntu 24.04 Desktop - Fresh Install
- Description:
  - Fresh Install of Ubuntu 24.04 server with `apt update`command executed after install and no further configuration.
- Root_VM: True
- Configuration:
  - Username: afewell
  - Password: redacted
  - Language: English
  - Time_Zone: PST - Los Angeles
