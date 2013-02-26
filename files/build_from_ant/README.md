## Note: The original scripts and instructions were provided by Ryan Clark at the Arizona Geological Survey, 2012 - see https://github.com/usgin/usgin-geoportal-addon/blob/master/README.md

## The Idea - 
- Provide an efficient mechanism for building the Geoportal web application from source code
- Simplify the installation process by making some assumptions about the setup environment:
	- You're happy using Tomcat
	- You're happy using PostgreSQL
	- You're happy with having a single admin user, rather than a managed LDAP authentication system.
- Use Ant to deploy the compiled application to a development environment or a production environment

## Pre-requisites:
1. Tomcat 6.x installed with manager app
2. Apache Ant installed and functional: Must have access to `catalina-ant.jar` 
	- This means finding `catalina-ant.jar` in Tomcat's `lib` directory, and copying it to Ant's `lib`
	- On Ubuntu, if you installed via `sudo apt-get install ant tomcat6`, you can probably `sudo ln -s /usr/share/tomcat6/lib/catalina-ant.jar /usr/share/ant/lib/`
3. PostgreSQL database engine setup and running
4. Database created and populated with Geoportal tables - the 'geoportal/etc/sql/schema_pg.sql' and grants_pg.sql `geoportal/etc/sql/schema_pg.sql` scripts should have been run

## Installation: see http://sourceforge.net/apps/mediawiki/geoportal/index.php?title=Use_Ant_to_build_Geoportal