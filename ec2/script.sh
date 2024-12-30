#!/bin/bash

EFS_ID="${efs_id}"
sudo yum install -y amazon-efs-utils && \
mkdir /efs && \
echo "$EFS_ID:/ /efs efs defaults,_netdev 0 0" >> /etc/fstab && \
sudo mount /efs