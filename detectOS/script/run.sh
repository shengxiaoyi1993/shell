#! /bin/sh

echo  "$(expr substr $(uname -s) 1 10)"

if [[ "$(uname)" == "Darwin" ]]; then
# Mac OS X 操作系统
  echo "mac"

elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
# GNU/Linux操作系统
  echo "linux"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
# Windows NT操作系统
  echo "win"
else
  echo "others"
fi
