#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y autoconf autopoint binutils curl gcc g++ gettext git libtool locales pkg-config python3 python3-pip unzip zip > /dev/null

locale-gen en_US.UTF-8

pip3 install cmake==3.30.3 -q

# Install Android NDK
export ANDROID_NDK_VERSION="r28"
if [ ! -d "/opt/android-ndk" ]; then
  curl -sSL -o /tmp/android-ndk.zip "https://dl.google.com/android/repository/android-ndk-$ANDROID_NDK_VERSION-linux.zip"
  unzip -q /tmp/android-ndk.zip -d /opt
  mv /opt/android-ndk-$ANDROID_NDK_VERSION /opt/android-ndk
  rm -f /tmp/android-ndk.zip
fi
