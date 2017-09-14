#!/bin/bash

# Get vendor ID
v=$(lsusb | grep "Huawei" | awk '{ print $6 }' | awk -F: '{ print $1 }')

# Get product ID
p=$(lsusb | grep "Huawei" | awk '{ print $6 }' | awk -F: '{ print $2 }')

# Enable Modem
sudo usb_modeswitch -v $v -p $p -M '55534243123456780000000000000011062000000100000000000000000000'
