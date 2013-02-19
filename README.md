vagrant-geoportal
=================

Create a vm serving GeoPortal in a matter of minutes.

### Create Virtual Machine and Install Dependencies:
``vagrant up``

### Install Postgres, Tomcat, and ESRI GeoPortal Server*
```fab dev init```
*Must install Fabric on your own computer

###Prompts:
*Password for vagrant
``vagrant``
*Create Password for user postgres
``postgres``
(accept the defaults)
*Create password for role geoportal
``geoportal``
(accept the defaults)
*Password for postgres
``postgres``