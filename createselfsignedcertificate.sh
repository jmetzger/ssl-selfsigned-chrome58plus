#!/bin/bash

SSL_EXEC_DIR=/usr/local/bin/ssl

if [ ! -d $SSL_EXEC_DIR ]
then 
  mkdir $SSL_EXEC_DIR 
fi
cd $SSL_EXEC_DIR

echo $(pwd) 
openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config <( cat $SSL_EXEC_DIR/server.csr.cnf )

# 
openssl x509 -req -in server.csr -CA ~/ssl/rootCA.pem -CAkey ~/ssl/rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext
