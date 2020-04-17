#!/bin/sh
PASSWORD="$(echo $(pwgen -n 1 -s $@) | sed 's/ //g')"
echo ${PASSWORD}