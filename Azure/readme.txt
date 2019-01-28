For Terraform to provision resources in Azure, there are two ways to authenticate:

1. Using an Azure PublishSettings file (ASM)
2. Using a Client ID and Client Secret for Microsoft Azure AD (ARM)
Azure PowerShell is required to download the Azure PublishSettings file. Use the following cmdlet:
#Get-AzurePublishSettingsFile
We can use this file in Terraform as credentials to provision resources in Azure (ASM).

The other way is to generate client id and client secret, to do so use below steps
1. Log in to the Azure Portal and select Azure Active Directory.
2. Click on App Registrations and select New Application Registration.
Follow the wizard and click on keys and note them

Using Terraform, we will provision the following things:

A resource group with one virtual network in it
Two subnets within the virtual network; one to deploy the web server and the other to deploy the database server
Two VMs; each in a different subnet
Two network interfaces, one for each VM. The network interface for the web server will have a public IP
A DNS zone for our domain with an A record

Steps:
1. First we will create variable file as variable.tf
2. In variable.tf we have not define any value, we will create another file called var_value.tfvars file
3. Starting from scratch first create a resource group, vnet, subnets. so creating network.tf file for the
   same and also using tag to identify.
4. Now we need a storage accound with a container to hold VHD so create storage accound and container so creating
   storage.tf file for the same. The container_access_type can be Private, Blob, or Container
5. Create security groups
6. Create an interface and public and private IP to associate with it so creating pip_int.tf
7. create an vm that will have os, and disk etc, this file has two vms and file vm_property.tf
8. Now install php and mysql from a bash script using terraform

The apache_php.sh script will do the following tasks:
Update the system
Download and install the Apache2 web server
Download and install PHP and other PHP modules
Download and copy demo.php file to /var/www/html
Change ownership of /var/www to www:data

The mysql_install.sh script will do the following tasks:
Update the system
Download and install MySQL packages (mysql-server and mysql)
Create a database

9. create a DNS zone

10 we can run terraform by supplying var file: terraform plan –var-file var_values.tfvars
