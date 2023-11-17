#!/usr/bin/env bash

# git config --global user.name "Venkata Ratnam Bhumireddy"
# git config --global user.email venkat4ratnam@gmail.com
# git clone https://github.com/steveicarus/iverilog.git
# cp ./iverilator .
cd iverilog

# build configuration files
sh autoconf.sh

# configure and install
./configure
make
make install
echo "Done!"

exit 0