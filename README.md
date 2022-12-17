
 Terraform github ansible pipeline :


--- yum install git on centos node

--- install terraform on centos host machine

give an admin role to centos host machine as it will give failure for aws configure whle building

--- install ansible on centos host machine 

sudo yum install epel-release

sudo yum install ansible


-- vi /etc/ansible/ansible.cfg
   uncomment host_key_checking=FALSE


--- create a keypair on centos hostmachine to import a keypair named cicd-import on aws ohio region to authenticate :
ssh-keygen -t rsa
-- import the public key to mumbai in creation cicd-import key

sripts for jenkins :


 terraform init
 terraform apply -auto-approve
 sleep 30
 ansible-playbook -i /tmp/inv -u ec2-user -b --become-method sudo web.yaml



poll the pipeleine
*****

