#!/bin/sh
pci=$1
WFO_Enable=$2

dev_type=-1

if [ $pci -eq 0 ]; then
dev_type=`get_pci_dev.sh | awk '{print $1}'`
else if [ $pci -eq 1 ]; then
dev_type=`get_pci_dev.sh | awk '{print $2}'`
else if [ $pci -eq 2 ]; then
dev_type=`get_pci_dev.sh | awk '{print $3}'`
fi
fi
fi

if [ $dev_type -eq 0 ]; then
     ##Atheros  11ac
     cd /rboot/wfo_atheros_11AC
     if [ "$WFO_Enable" == "1" ]; then
       ./wfo_start.sh  
     elif [ "$WFO_Enable" == "14" ]; then
       /rboot/rboot ar988x_pe0.bin /rboot/ipsec/ipsec_pe1.bin
       #/rboot/rboot ar988x_pe0.bin

       sleep 2
       echo "enabling 11AC WFO..."
       echo 1 > /proc/driver/cs752x/wfo/wifi_offload_enable
       sh ath_11ac_ap.sh $pci 2
     else
       ./ath_11ac_ap.sh $pci
        
     fi     
     exit 0
fi

if [ $dev_type -eq 1 ]; then
     ##Atheros  11n
     cd /rboot/wfo_atheros_11AC
     if [ "$WFO_Enable" == "1" ]; then
       	/rboot/rboot ar988x_pe0.bin ar9580_pe1.bin 
	sleep 2
	echo "enabling 11n WFO..."
	echo 1 > /proc/driver/cs752x/wfo/wifi_offload_enable 
	./ath_11n_ap.sh $pci 1
     else
       ./ath_11n_ap.sh $pci
     fi     
     exit 0
fi
