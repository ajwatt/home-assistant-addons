This is a mostly working addon for the speakerPHAT, but it is a lot easier to use the Home Assistant VLC addon. I'm leaving this repository here for posterity.

To get the SpeakerPHAT to work in a Home Assistant installation, you need to enable the device in the Home Assistant OS host.
  1. Set up SSH access with a ssh key pair as outlined in the HA [instructions here](https://developers.home-assistant.io/docs/operating-system/debugging/#enabling-ssh-access-to-the-host).
  2. On the host, create the file `/mnt/boot/usercfg.txt` if it does not exist, then edit it and add the following lines:
  ```
    dtparam=i2c_vc=on  
    dtparam=i2c_arm=on  
    dtoverlay=i2s-mmap  
    dtoverlay=hifiberry-dac  
  ```
  3. If the usercfg.txt file above did not exist, then it probably needs to be included in the `/mnt/boot/config.txt` file. Add the following line there:
  ```
    include usercfg.txt
  ```
  4. Create the file `/etc/modules-load.d/rpi-i2c.conf` and add the following line:
  ```
    i2c-dev
  ```
  5. Finally, reboot the machine for the changes to take effect.

To test it, either install the VLC addon and try playing a sound, or install the "Terminal and SSH" addon and perform the following steps in the terminal:
  ```
    apk add --no-cache alsa-utils
    aplay /path/to-a/sound-file.wav
  ```
