# Deploiement dans AWS avec Terraform
La configuration Terraform dans ce repository permet de deployer une instance EC2, un VPC, un security group et un backend S3
## Prerequis
les elements ci-dessous seront necessaire afin de commencer :
- installation de Terraform
- recuperation des clés d'authentification AWS
- Windows 10
## Configuration
1. Telechargement des fichiers du depot github :
   
    - 00_provider.tf
    - 01_ressources.tf
    - variables.tf
    - variables.tfvar
      
2. Modification des variables dans le fichier 'variables.tfvar' :

  ```hcl
    a_key         = "votre_clé_d'accès_aws"
    s_key         = "votre_clé_secrète_aws"
    instance_type = "votre_type_instance"
    id_ami        = "numero_AMI"
  ```
3. Initialisation et planification de la configuration :

   ```bash
    terraform init -var-file="variables.tfvar"
    terraform plan -var-file="variables.tfvar"
   ```
4. Application de la configuration :
   
   ```bash
    terraform apply -var-file="variables.tfvar"
   ```
## Supression du projet sur AWS :
  ```bash
    terraform destroy -var-file="variables.tfvar"
   ```
