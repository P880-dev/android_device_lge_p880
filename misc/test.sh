#!/bin/bash

paths="frameworks/native frameworks/base hardware/libhardware"

for path in ${paths}; do
	
	commit_path=$(echo ${path} | sed 's/\//_/')
	
	echo $commit_path
done
