#!/bin/bash
##Destroys the default QEMU shield
cset set --destroy --set=machine.slice

##Modifies the default 'system' shield to only use cores 0 and 4
cset set --cpu=0,4 --mem=0 --set=system

##Move all threads from root to system (to isolate them to cores 0 and 4)
##The root shield is spread across cores 0-7 (and we can't modify any properties of the root shield)
cset proc --move --fromset=root --toset=system

##Move unpinned kernel threads to the system shield
cset proc --kthread --fromset=root --force --toset=system

## FUTURESTEPS: 1 force move pinned kernel threads
## 2 move QEMU and VIRTUAL MACHINE specific threads to the "USER" shield.
## (the User shield runs in REALTIME priority and the linux scheduler
## doesn't touch it at all)
## FUTURESTEPS: ATTEMPT ONE
## force moved all kernel threads to cores 0 and 4
## virtual machine impact unknown
