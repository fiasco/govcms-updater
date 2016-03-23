#!/bin/bash
updater_dir=`dirname $0`;

opts='';
if [ "$1" != "" ]; then
  opts="-Dbuild.git.ref=$1";
fi

if [ ! -d ${updater_dir}/vendor ]; then
  echo "Error: Composer has not installed dependancies. Please run: 'composer install' in ${updater_dir} first."
  exit 2;
fi

${updater_dir}/vendor/bin/phing -f ${updater_dir}/build.xml project:build $opts
