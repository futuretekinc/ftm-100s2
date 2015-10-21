#!/bin/sh

DEV_AC="wifi$1"
IF_NAME="wlan$1"
LINUX_VERSION=`awk '{print $3;}' /proc/version`

echo "Atheros 11ac device is $DEV_AC"

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
wlanconfig $IF_NAME create wlandev $DEV_AC wlanmode ap
sleep 2
iwpriv $IF_NAME mode 11ACVHT80
sleep 1
iwpriv $IF_NAME wds 1
iwconfig $IF_NAME essid ika_test
iwconfig $IF_NAME channel 48
iwpriv $IF_NAME shortgi 1
iwpriv $IF_NAME ldpc 1
brctl addif br-lan $IF_NAME
ifconfig $IF_NAME up

echo 1 > /proc/irq/65/smp_affinity
echo 2 > /proc/irq/70/smp_affinity
