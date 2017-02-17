#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

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
    docker         Install Docker
    docker-compose Install Docker Compose
    docker-machine Install Docker Machine
    docker-ac      Install Docker Autocomplete CLI
    ansible        Install Ansible Provisioner
    saltstack      Install SaltStack Provisioner
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

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
            bash ./bin/server/awscli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        consul)
            bash ./bin/server/hashicorp/consul.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker)
            bash ./bin/server/docker.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-ac)
            bash ./bin/server/docker-ac.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-compose)
            bash ./bin/server/docker-compose.sh
            echo ""
            echo "====================================================================="
            ;;
        docker-machine)
            bash ./bin/server/docker-machine.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        iperf)
            bash ./bin/server/benchmark/iperf.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        nomad)
            bash ./bin/server/hashicorp/nomad.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        packer)
            bash ./bin/server/hashicorp/packer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        saltstack)
            bash ./bin/server/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        serf)
            bash ./bin/server/hashicorp/serf.sh
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
            bash ./bin/server/benchmark/sysbench.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        terraform)
            bash ./bin/server/hashicorp/terraform.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vagrant)
            bash ./bin/server/hashicorp/vagrant.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vault)
            bash ./bin/server/hashicorp/vault.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        wrk2)
            bash ./bin/server/benchmark/wrk2.sh
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

    esac


done
