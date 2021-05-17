#!/bin/bash
# 用于创建通用项目
PRO_SRC='example/'

echo "=================input start===================="
echo 'please input target project_name:' && read project_name
echo "project_name:${project_name}"
echo "=================input end ===================="


IS_SAME_EXIST=0
FILES_CURRENT=$(ls .)
for value in ${FILES_CURRENT}
do
  if [ ${value} == ${project_name} ]; then
    IS_SAME_EXIST=1
  fi
done

echo "=================operation start===================="
if [ ${IS_SAME_EXIST} -eq 1 ]; then
  echo "[Fail]:"
  echo "${project_name} already existd !"

else
  cp $PRO_SRC ${project_name} -rf
  echo "[Succeed]:"
  echo 'generate project:'${project_name}
  echo 'src project     :'$PRO_SRC
fi
echo "=================operation end===================="
