# Raspberry Pi OS

## Write to sd card

unzip -p <raspbian-image-archive.zip> | sudo dd bs=4M of=</dev/sd-card> conv=fsync status=progress

## Enable SSH

Create file `ssh` in root of boot partition of sd card

## Setup WiFi

Create file `wpa_supplicant.conf` in root of boot partition of sd card (fill in the necessary values)

    country=DE
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    network={
    			ssid="<ssid>"
    			psk=<hashed password>
    			key_mgmt=WPA-PSK
    }

For getting hashed password, run `wpa_passphrase "<ssid>"` and then enter the password.

## Setup default user pi

Create file `userconf` in root of boot partition of sd card (fill in the necessary values)

    pi:<encrypted password>

For getting encrypted password, run `echo 'mypassword' | openssl passwd -6 -stdin`
