#!/bin/bash
ssh-copy-id -o "StrictHostKeyChecking no" -f -i /home/iaas/.ssh/id_rsa.pub iaas@10.0.255.250
scp /home/iaas/token iaas@10.0.255.250:/home/iaas/token
