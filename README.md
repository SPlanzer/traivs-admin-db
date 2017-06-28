# LINZ administration boundary source code and deployment
The purpose of this is the deployment of LINZ administration boundaries schema
and tables to a postgreSQL database as stood up via Vagrant and Ansible.

## Source Code
As well as means for deploying the admin_bdy database this is also the current
source code repository for LINZ administration boundaries database. See the
[files directory](https://github.com/linz/admin-bdy-db-deployment/tree/dev/deployment/roles/admin-db/files). 
(TO CONSIDER: move source code to its own repository rather than have buried 
here in the files dir)


## Dependencies

### LINZ Ansible deployment
https://github.com/linz/Ansible-deployment

The deployment of the administration boundaries requires that the [LINZ
Ansible Deployment](https://github.com/linz/Ansible-deployment) has
been fetched. The roles in this LINZ Ansible deployment are required to
build the basic system and postgreSQL/postGIS database.

### Aims Deployment
The [AIMS deployment](https://github.com/linz/AIMS-deployment) depends
on the administration boundaries Ansible deployment code when deploying the
AIMS system to met the administration boundary dependancies of AIMS

###  Admin Boundaries Interface
The [LINZ Admin Boundaries Interface](https://github.com/linz/AdminBoundaries))
is a front end web app that can be used to update the data in the administration
boundaries tables.

## Deployment with Vagrant
Basic commands:
 * **vagrant status**               - check servers list and their status
 * **vagrant up HOST-NAME**         - start server
 * **vagrant provision HOST-NAME**  - update server
 * **vagrant ssh HOST-NAME**        - connect to server
 * **vagrant halt HOST-NAME**       - halt server
 * **vagrant destroy HOST-NAME**    - delete server

There are two deployment tasks for every role:
 * **deploy**    - production deployment (required)
 * **test**      - integration tests (optional, depends on production deployment)

By default, all available tasks are executed, however it is possible to limit
them using _--provision-with_ parameter:
 * **vagrant up|provision
   --provision-with deploy HOST-NAME**  - run only production deployment tasks

 Example of production deployment:
 ```
 $ vagrant up --provision-with deploy
 ```

 Example of running just the tests:
 ```
 $ vagrant up --provision-with test
 ```

## Security

Deployment process contains some private information placed in encrypted
variables files. A password is required to decrypt these files.

The Password must be obtained out-of-band (ask Ivan Mincik by mail,
for example).

The password will be asked to the user when running certain `Ansible`
commands (which are often triggered by `vagrant` commands like
`vagrant up` or `vagrant provision`). Be aware that the `Vault password`
prompt is hard to read because happens to be on the same line with
some other debugging, resulting in a line like this:

   Vault password: Using .../Ansible-deployment/Ansible.cfg as config file

Don't be fooled by the odd prompt but type that password and hit
enter.

To avoid always typing the password (and being confused by prompt),
write it once into an _Ansible-password.txt_ file in the same directory
where Vagranfile file exists. It will be automatically detected when needed.
