#!/bin/bash

function  print {
  echo "in func"
  echo "$#"
  echo "$1"
  print $#
}

print 5 6 7
