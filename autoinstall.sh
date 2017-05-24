#!/bin/bash
#
# This will automatically install packages without a prompt,
# It only works once you uncomment items in the list below.

# @instructions
#   In the autoinstall array below,
#   Remove the # beside the bin/ items you want installed.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Skip the brief pause after a package install
export SKIP_SLEEP=true

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh

# Skip the Sleep Delay
export SKIP_SLEEP=1

# ------------------------------------------#
#  Uncomment the items you want to install  #
# ------------------------------------------#
autoinstall=(
    #-----------#
    #  General  #
    #-----------#
    # bin/dot.sh
    # bin/perm.sh
    # bin/security.sh
    bin/util.sh
    # bin/vim

    #-----------#
    #  Desktop  #
    #-----------#
    bin/desktop/apport-off.sh
    # bin/desktop/btn-left.sh
    # bin/desktop/btn-right.sh
    bin/desktop/gui.sh
    bin/desktop/mysql-workbench.sh
    bin/desktop/numix.sh
    bin/desktop/sublime-text.sh
    #bin/desktop/vmware-tools.sh
    bin/desktop/vscode.sh


    #----------#
    #  Devops  #
    #----------#
    bin/devops/ansible.sh
    bin/devops/awscli.sh
    bin/devops/gcloud.sh
    bin/devops/docker.sh
    # bin/devops/docker-ac.sh
    # bin/devops/docker-compose.sh
    # bin/devops/docker-machine.sh
    # bin/devops/logstash.sh
    # bin/devops/saltstack.sh
    # bin/devops/benchmark/iperf.sh
    # bin/devops/benchmark/sysbench.sh
    # bin/devops/benchmark/wrk2.sh
    # bin/devops/hasicorp/consul.sh
    # bin/devops/hasicorp/nomad.sh
    # bin/devops/hasicorp/packer.sh
    # bin/devops/hasicorp/serf.sh
    # bin/devops/hasicorp/terraform.sh
    bin/devops/hasicorp/vagrant.sh
    # bin/devops/hasicorp/vault.sh

    #----------#
    #  Server  #
    #----------#
    bin/server/apache.sh
    # bin/server/elasticsearch.sh
    # bin/server/go.sh
    bin/server/java.sh
    # bin/server/mongo.sh
    # bin/server/mysql.sh
    # bin/server/nginx.sh
    bin/server/node.sh
    bin/server/php-7.0.sh
    # bin/server/php-7.1.sh
    bin/server/php-composer.sh
    bin/server/php-laravel.sh
    bin/server/php-phalcon.sh
    # bin/server/postgres.sh
    bin/server/py.sh
    bin/server/rb.sh
    bin/server/redis.sh
)

# Make sure something will run!
if [ ${#autoinstall[@]} == 0 ]; then
    echo ""
    echo "(!) You have not uncommented any packages you want to install!"
    echo "    Please remove # tags from the autoinstall array."
    echo ""
    exit
fi

echo "====================================================================="
echo "                   JREAM - Ubuntu Instant Install                    "
echo "====================================================================="
echo ""

echo "(+) Packages set to install:"
for i in "${autoinstall[@]}"
do
   :
   echo " - $i"
done
echo ""

read -p "Install the following packages all at once? [y/N]: " cmd


if [ $cmd != 'y' ]; then
    echo ""
    echo "(!) No installation Run, you must choose: y to confirm."
    echo ""
    exit
fi


# Run the Script for all uncommented items
for i in "${autoinstall[@]}"
do
   :
   bash $i
done

# Complete
echo "(+) Install Script Finished"
exit
