#!/usr/bin/env bash

ANDROID_SDK_HOME=
ANDROID_SDK_PLATFORM_TOOLS_DIR=$ANDROID_SDK_HOME/platform-tools

# --- Examples ---

# List devices
$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb devices

# Acquire ip address
$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb -s 00243bdb shell ip -f inet addr show wlan0

# Enable network mode
$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb -s 00243bdb tcpip 5555

# Connect to device
$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb connect 192.168.1.210

# Change to usb mode
$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb -s 192.168.1.210:5555 usb
