#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq

apt-get install -y -qq autoconf autopoint binutils curl gcc g++ git libtool locales pkg-config python python3-pip unzip > /dev/null

locale-gen en_US.UTF-8

pip3 install --upgrade pip -q
pip3 install cmake==3.30.3 -q

# Install Android NDK
export ANDROID_NDK_VERSION="r28"
if [ ! -d "/opt/android-ndk" ]; then
  curl -sSL -o /tmp/android-ndk.zip "https://dl.google.com/android/repository/android-ndk-$ANDROID_NDK_VERSION-linux.zip"
  unzip -q /tmp/android-ndk.zip -d /opt
  mv /opt/android-ndk-$ANDROID_NDK_VERSION /opt/android-ndk
  rm -f /tmp/android-ndk.zip
fi
