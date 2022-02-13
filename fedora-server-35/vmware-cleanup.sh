#!/bin/bash
#Défragmentation des disques virtuels
sudo xfs_fsr -v /
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
sync
sudo vmware-toolbox-cmd disk shrink /