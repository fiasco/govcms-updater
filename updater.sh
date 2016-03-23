#!/bin/bash -x

updater_dir=`dirname $0`;

opts='';
if [ "$1" != "" ]; then
  opts="-Dbuild.git.ref=$1";
fi

${updater_dir}/vendor/bin/phing -f ${updater_dir}/build.xml project:build $opts
