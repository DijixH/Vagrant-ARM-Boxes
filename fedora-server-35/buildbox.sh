#!/bin/bash

packer init vmware-fedora35.pkr.hcl
packer build -force vmware-fedora35.pkr.hcl
cp metadata.json output/metadata.json
cd output
tar cvzf vmware-fedora35-server-arm64.box ./*
md5 vmware-fedora35-server-arm64.box
rm -f *.v* *.nvram metadata.json