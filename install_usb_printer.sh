#!/bin/bash


echo "Installing Epson USB printer for nixPOSBASE usage";
dmesg | grep usblp1
echo "Do you see an USB bidirectional printer shown"
read promptUSBprinter
if [$promptUSBprinter = "yes"]
then
    "What is your user name?"
    read username
    sudo usermod -a -G lp $username
    sudo usermod -a -G lp www-data
fi

sudo /etc/init.d/apache2 restart
echo "Log Out and Log back in"


       
       
