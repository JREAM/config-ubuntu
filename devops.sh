#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='desktop'

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh

echo "====================================================================="
echo ""
echo "                        JREAM - Ubuntu Server                        "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    DevOps:
    -------
    awscli         Install AWS CLI tools
    azurecli       Install Microsoft Azure CLI tools
    gcloud         Install Google Cloud CLI tools

    docker         Install Docker, Compose, Machine & bash-autocomplete
    docker-mint    Install Docker on Linux Mint 18.2

    ansible        Install Ansible Provisioner
    saltstack      Install Saltstack Provisioner
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

    Deployment
    ----------
    kubernetes     Install Kubernetes (kubectl)
                   (or use: kubtectl to install)
    minikube       Install Minikube (local kubernetes development)
                   (You will need virtualbox installed for minikube)

    Benchmarking:
    -------------
    iperf          Install iperf CLI util
    sysbench       Install sysbench CLI util
    wrk2           Install wrk2 CLI util

    Utilities:
    ----------
    security      Install ClamAV, RKHunter (read instructions after install)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd

    case $cmd in
        awscli)
            bash ./bin/devops/awscli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        azurecli)
            bash ./bin/devops/azurecli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        consul)
            bash ./bin/devops/hashicorp/consul.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker)
            bash ./bin/devops/docker.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-mint)
            bash ./bin/devops/docker-mint.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gcloud)
            bash ./bin/devops/gcloud.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        iperf)
            bash ./bin/devops/benchmark/iperf.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        nomad)
            bash ./bin/devops/hashicorp/nomad.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        packer)
            bash ./bin/devops/hashicorp/packer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        kubernetes|kubectl)
            bash ./bin/devops/kubernetes.sh
            echo ""
  ¦ ¦ ¦ ¦ ¦ echo "====================================================================="
  ¦ ¦ ¦ ¦ ¦ echo ""
            ;;
        minikube)
            bash ./bin/devops/minikube.sh
  ¦ ¦ ¦ ¦ ¦ echo ""
  ¦ ¦ ¦ ¦ ¦ echo "====================================================================="
  ¦ ¦ ¦ ¦ ¦ echo ""
            ;;
        saltstack)
            bash ./bin/devops/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        serf)
            bash ./bin/devops/hashicorp/serf.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        saltstack)
            bash ./bin/devops/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        security)
            bash ./bin/security.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        sysbench)
            bash ./bin/devops/benchmark/sysbench.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        terraform)
            bash ./bin/devops/hashicorp/terraform.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vagrant)
            bash ./bin/devops/hashicorp/vagrant.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vault)
            bash ./bin/devops/hashicorp/vault.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        wrk2)
            bash ./bin/devops/benchmark/wrk2.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        q)
            exit 1
            ;;
        *)
            echo ""
            echo "    (!) OOPS! You typed a command that's not available."
            echo ""
            echo "====================================================================="
            echo ""
            sleep 2

    esac


done
