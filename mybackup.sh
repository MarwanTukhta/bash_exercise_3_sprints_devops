#!/bin/bash
mkdir backup
for f in `ls -p ~| grep -v /`; do
  cp $f backup/
done