#Exit immediately if a command exits with a non-zero status
set -e
#Print commands and their arguments as they are executed
set -x

sudo yum -y update
sudo yum -y install epel-release