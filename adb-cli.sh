#!/usr/bin/env bash

if [ "${ANDROID_SDK_HOME}" = "" ]; then
    echo "ANDROID_SDK_HOME is not set"
    exit 1
fi
ANDROID_SDK_PLATFORM_TOOLS_DIR=$ANDROID_SDK_HOME/platform-tools

usage() {
    echo "Usage: db-cli.sh [options]"
    echo ""
    echo "options:"
    echo "  -ls: list devices"
    echo "  -ip: show ip config"
    echo "  -n ip_addr: change to network mode"
    echo "  -u ip_addr: change to usb mode"
    echo "  -push file: push file to Download folder"
}

if [ "$1" = "" ]; then
    $1=-h
fi

while [ "$1" != "" ]; do
    case $1 in
        -ls )
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb devices
            break
            ;;
        -ip )
            #$ANDROID_SDK_PLATFORM_TOOLS_DIR/adb -s 07243bdc shell ip -f inet addr show wlan0
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb shell ip -f inet addr show wlan0
            break
            ;;
        -n )
            ip_addr=$2
            shift

            if [ "${ip_addr}" = "" ]; then
                echo "ip_addr is not set"
                exit 1
            fi

            # enable network mode
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb tcpip 5555

            # connect to device
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb connect ${ip_addr}
            break
            ;;
        -u )
            ip_addr=$2
            shift

            if [ "${ip_addr}" = "" ]; then
                echo "ip_addr is not set"
                exit 1
            fi

            # change to usb mode
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb -s ${ip_addr}:5555 usb
            break
            ;;
        -push )
            file=$2
            shift

            if [ "${file}" = "" ]; then
                echo "file is not set"
                exit 1
            fi

            # push file
            $ANDROID_SDK_PLATFORM_TOOLS_DIR/adb push ${file} /sdcard/Download/
            break
            ;;
        * ) usage
            exit 1
            ;;
    esac
    shift
done

