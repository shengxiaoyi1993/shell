#!/bin/bash
# 上传文件到FTP
cd ${DIR_DEPLOY_OUTPUT}
lftp << EOF
open ftp://pub:9900@192.168.1.238
cd release/uvs320/UVSS320_SW_release/Client
mkdir ${STRING_VERSION_CHANGE} -f
cd ${STRING_VERSION_CHANGE}
put ${ZIP_NAME_DEPLOY_PACAGE}
put ${FILE_EXE_PUB}
put ${FILE_INFO}
put ${FILE_VERSION}
close
bye
EOF
