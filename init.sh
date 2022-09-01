#!/bin/bash

_path='/opt'
_dbinit="$_path/dbinit"
_dbdata="$_path/dbdata"
_nginx="$_path/nginx/ssl"

rm -rf ${_path}/{dbinit,dbdata,nginx/ssl,guacdrive,guacrecord} >/dev/null 2>&1
cp -rf ./nginx ${_path}/
mkdir -p ${_path}/{dbinit,dbdata,nginx/ssl,guacdrive,guacrecord} >/dev/null 2>&1

docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ${_dbinit}/initdb.sql

openssl req -nodes -newkey rsa:2048 -new -x509 -keyout ${_nginx}/self-ssl.key -out ${_nginx}/self.cert -subj '/C=US/O=ESS/OU=DoD/OU=PKI/CN=guac' >/dev/null 2>&1

chmod -R 775 ${_path}/{dbinit,dbdata,nginx/ssl,guacdrive,guacrecord} >/dev/null 2>&1  

#docker-compose up -d
