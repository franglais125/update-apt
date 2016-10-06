#!/bin/bash

# Temporary build directory
mkdir build/
cp *.sh build/.
cd build/

## MODIFY IF NECESSARY
basedir=~/.update-apt
sed -i 's,___BASEDIR___,'"$basedir"',' update_apt.sh

# Add relevant files to a new directory
mkdir -p ${basedir}/tmp
cp help.sh clean.sh local.sh new.sh obsolete.sh residual.sh update_apt.sh upgradable.sh ${basedir}

# Add "upd" alias to bash_aliases
if [ -f ~/.bash_aliases ]; then
if ! grep -q update_apt ~/.bash_aliases ; then
cat << EOF >> ~/.bash_aliases
alias upd='${basedir}/update_apt.sh'
EOF
fi
else
cat << EOF >> ~/.bash_aliases
alias upd='${basedir}/update_apt.sh'
EOF
fi

# Remove build directory
cd ../
rm build/*.sh
rmdir build/
