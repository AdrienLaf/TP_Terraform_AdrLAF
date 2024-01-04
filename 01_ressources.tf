
# creation de l'instance EC2
resource "aws_instance" "app_server" {
  ami           = var.id_ami # AMI gratuite amazon à utiliser
  instance_type = var.instance_type # type d'instance
  
  vpc_security_group_ids = ["aws_security_group.allow_tls.id"] # utilisation du groupe de securité

  tags = {
    Name = "instancecapgipi"
  }
}
# creation d'un VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16" # definition du réseau utilisé
}  

# creation du groupe de sécurité
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls" # nom du groupe de sécurité
  description = "Allow TLS inbound traffic" # description du groupe "autoriser le traffic entrant TLS"
  vpc_id      = aws_vpc.main.id
 
  # ouverture de port pour le traffic entrant
  ingress {
    description      = "TLS from VPC" # description de la regle
    from_port        = 443 # numero de port autorisé
    to_port          = 443 # numero de port autorisé
    protocol         = "tcp" # protocole autorisé
    cidr_blocks      = [aws_vpc.main.cidr_block] # réseau autorisé
  }
  # ouverture du traffic sortant
  egress {
    from_port        = 0 # tous les ports autorisés
    to_port          = 0 # tous les ports autorisés
    protocol         = "-1" # tous les protocoles autorisés
    cidr_blocks      = ["0.0.0.0/0"] # tous les réseaux autorisés
  }
 
  tags = {
    Name = "allow_tls" # tags afin d'identifier le groupe de sécurité
  }
  # configuration d'un backend
  backend "s3" {
    bucket = "bucketcapgipi" # nom du bucket S3
    key    = "tfstate/bucketcapgipi.tfstate" # chemin de stockage
    region = "eu-west-3" # region utiliser
  }
}

