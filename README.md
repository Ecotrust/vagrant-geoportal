vagrant-geoportal
=================

Create a vm serving GeoPortal in a matter of minutes.

Under the files dir you will find code written by ESRI inc, licensed under the Apache License, Version 2.0. This license is included in this repository.

### Local Requirements:
* [git] (https://help.github.com/articles/set-up-git)
* [VirtualBox] (http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html)
* [Vagrant] (http://www.vagrantup.com/)
* [Fabric] (http://fabfile.org)

### Create Virtual Machine and Install Dependencies:
``vagrant up``

### Install Postgres, Tomcat, and ESRI GeoPortal Server
```fab dev init```

Or, if you want to run from a fresh .war build from bleeding-edge geoportal code:
```fab dev build_new```

*NOTE: currently there's an issue with running installs from the fabfile. If you ssh into the VM and run the fabfile commands by hand it works fine.

### Prompts:
* Password for vagrant
``vagrant``
* Create Password for user postgres
``postgres``
    (accept the defaults)
* Create password for role geoportal
``geoportal``
    (accept the defaults)
* Password for postgres
``postgres``

### Using
* Open a browser and navigate to [http://localhost:8081/geoportal/catalog/main/home.page] (http://localhost:8081/geoportal/catalog/main/home.page)
* Click 'Login'
* Enter credentials 'gptuser', 'gptuser'