#! /bin/bash

read -p "Find package name with command $'adb shell pm list packages'. Enter uninstall package (com.myproject.app): " PACKAGE
# rlwrap -S "Enter installation .apk file: " APK
read -p "Enter installation .apk file: " APK

function reinstallBuild() {
    for DEVICE in `adb devices | grep -v "List" | awk '{print $1}'`
    do
        adb -s $DEVICE uninstall $PACKAGE
            echo "The package_name: $PACKAGE was uninstalled from device: $DEVICE"
        adb -s $DEVICE install $APK
            echo "The $APK file was installed to the device: $DEVICE"
done
}

reinstallBuild 