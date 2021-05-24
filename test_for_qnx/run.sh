if (file sample | grep x86-64) ; then
  PLATFORM="Linux-x86_64"
else
  if (file sample | grep Linux) ; then
    PLATFORM="Linux-TDA4"
  else
    PLATFORM="QNX-TDA4"
  fi
fi
echo "PLATFORM: ${PLATFORM}"

if [ "Linux-x86_64" = "${PLATFORM}" ]; then
  time ./sample
  #LD_LIBRARY_PATH=.:./lib ./sample
elif [ "Linux-TDA4" = "${PLATFORM}" ]; then
  if (uname -a | grep x86_64) ; then
      export SSHPASS_STR=" "
      export SSH_IP_USER=root@10.8.104.56
      export PACKAGE_FILE=package.tar.gz
      export TARGET_PATH=/work/test_qnx

        aarch64-linux-gnu-strip sample
        tar zcvf ${PACKAGE_FILE} sample
        ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "mkdir -p ${TARGET_PATH}"
        ${SSHPASS_STR} scp -o StrictHostKeyChecking=no ${PACKAGE_FILE} ${SSH_IP_USER}:${TARGET_PATH}
        ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "cd ${TARGET_PATH}; tar zxvf ${PACKAGE_FILE}"

        ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "pkill sample"
        ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "cd ${TARGET_PATH}; time ./sample"
  else
      time ./sample
  fi
elif [ "QNX-TDA4" = "${PLATFORM}" ]; then
  if (uname -a | grep x86_64) ; then
    export SSHPASS_STR="sshpass -p root"
    export SSH_IP_USER=root@172.21.64.109
    export PACKAGE_FILE=sample
    export TARGET_PATH=/work/test_qnx
    SOURCE_CMD=". ~/.profile;"

      ntoaarch64-strip sample
      ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "mkdir -p ${TARGET_PATH}"
${SSHPASS_STR} sftp -o StrictHostKeyChecking=no ${SSH_IP_USER}:${TARGET_PATH} << !
  put ${PACKAGE_FILE}
  quit
!

      ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "spid=`ps | grep sample | awk '{print $1}'`; if [ ! -z $spid ]; then kill $spid; fi"
      ${SSHPASS_STR} ssh -o StrictHostKeyChecking=no ${SSH_IP_USER} "cd ${TARGET_PATH}; ${SOURCE_CMD} time ./sample"
  else
      time ./sample
  fi
else
  echo "Do not support!"
fi

