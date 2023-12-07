#!/bin/sh

# 根据http://wjholden.com/nmap/src/0.3.7/res/raw/nmap_mac_prefixes，Xilinx设备的组织唯一标识符为000A35 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mac=$( echo -n 00:0A:35 ; dd bs=1 count=3 if=/dev/random 2>/dev/null |hexdump -v -e '/1 ":%02X"')
# echo "mac:${mac}"

mac_entry="__mac = \"${mac}\""

# echo "mac_entry:${mac_entry}"

filename="${DIR}/../resources/Network.toml"

cat "${filename}"

line=$(grep -n "__mac" $filename | cut -d ":" -f 1)

echo "line:${line}"

replace=$line"c ${mac_entry}"
sed -i "$replace" "$filename"

# cat "${file}" | sed 's/:.*//'  | sort -u

