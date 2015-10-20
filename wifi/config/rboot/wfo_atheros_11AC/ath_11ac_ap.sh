dev_ac='none'
if_name='none'
if [ $1 -eq 0 ]; then
	dev_ac='wifi0'
	if_name='wlan0'
else if [ $1 -eq 1 ]; then
	dev_ac='wifi1'
	if_name='wlan2'
else if [ $1 -eq 2 ]; then
	dev_ac='wifi2'
	if_name='wlan2'
else
  	echo "ERROR!! cannot find 11ac device!!"
   	exit 0
fi
fi
fi

LINUX_VERSION=`awk '{print $3;}' /proc/version`

echo "Atheros 11ac device is $dev_ac"

echo 0x605 > /proc/driver/cs752x/acp/acp_enable

if [ $2 ]; then
  if  [ $2 -eq 1 ]; then
    cd /lib/modules/$LINUX_VERSION/atheros_wfo/
  else
    if [ $2 -eq 2 ]; then
      cd /lib/modules/$LINUX_VERSION/atheros_wfo_11ac/
    else
      if  [ $2 -eq 3 ]; then
        cd /lib/modules/$LINUX_VERSION/atheros_wfo_11n/
      fi
    fi
  fi  
else
  cd /lib/modules/$LINUX_VERSION/
fi

insmod adf.ko
insmod asf.ko
insmod ath_hal.ko msi_enable=1
[ -f ath_spectral.ko ] && insmod ath_spectral.ko
insmod ath_rate_atheros.ko
insmod ath_dfs.ko
insmod ath_dev.ko
sleep 2
insmod umac.ko
sleep 2
wlanconfig $if_name create wlandev $dev_ac wlanmode ap
sleep 2
iwpriv $if_name mode 11ACVHT80
sleep 1
iwpriv $if_name wds 1
iwconfig $if_name essid ika_test
iwconfig $if_name channel 48
iwpriv $if_name shortgi 1
iwpriv $if_name ldpc 1
brctl addif br-lan $if_name
ifconfig $if_name up

echo 1 > /proc/irq/65/smp_affinity
echo 2 > /proc/irq/70/smp_affinity
