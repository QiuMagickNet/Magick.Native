#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -qq

sudo apt-get install -y -qq autoconf autopoint binutils curl gcc g++ git libtool locales pkg-config python3 python3-pip unzip > /dev/null

locale-gen en_US.UTF-8

sudo pip3 install --upgrade pip -q
sudo pip3 install cmake==3.30.3 -q

# Install Android NDK
export ANDROID_NDK_VERSION="r28"
if [ ! -d "/opt/android-ndk" ]; then
  sudo curl -sSL -o /tmp/android-ndk.zip "https://dl.google.com/android/repository/android-ndk-$ANDROID_NDK_VERSION-linux.zip"
  sudo unzip -q /tmp/android-ndk.zip -d /opt
  sudo mv /opt/android-ndk-$ANDROID_NDK_VERSION /opt/android-ndk
  sudo rm -f /tmp/android-ndk.zip
fi