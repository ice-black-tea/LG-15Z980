#!/bin/bash
# The script is a mini version of https://github.com/xzhih/one-key-hidpi, thanks to @xzhih
# Only support lg gram (30e4,5a8)

DISPLAY_PATH="/System/Library/Displays/Contents/Resources/Overrides"
DISPLAY_BACK_PATH="$DISPLAY_PATH/LG_Backup"
DISPLAY_STORE_PATH="$(cd "$(dirname "$0")"; pwd)"

DISPLAY_VENDOR_ID="30e4"
DISPLAY_PRODUCT_ID="5a8"

# Interface (Ref:https://github.com/xzhih/one-key-hidpi/master/hidpi.sh)
function interface() {
    echo '  _    _   _____   _____    _____    _____ '
    echo ' | |  | | |_   _| |  __ \  |  __ \  |_   _|'
    echo ' | |__| |   | |   | |  | | | |__) |   | |'
    echo ' |  __  |   | |   | |  | | |  ___/    | |'
    echo ' | |  | |  _| |_  | |__| | | |       _| |_ '
    echo ' |_|  |_| |_____| |_____/  |_|      |_____|'
    echo 'This script is only for LG Gram!'
    echo '============================================'
}

# Choose option
function choice() {
    choose=0
    echo '(1) Enable HiDPI'
    echo '(2) Disable HiDPI'
    echo '(3) Exit'
    read -p "Enter your choice [1~3]: " choose
}

function removeold() {
    sudo rm -rf $DISPLAY_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID
    echo 'Remove complete'
    echo
}

# Create backup for Icons.plist
function backup() {
    echo 'Backing up...'
    sudo mkdir -p $DISPLAY_BACK_PATH
    sudo cp $DISPLAY_PATH/Icons.plist $DISPLAY_BACK_PATH/
    echo 'Back up complete'
    echo
}

# Copy the display folder
function copy() {
    echo 'Copying file to target address...'
    sudo mkdir -p $DISPLAY_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID
    sudo cp $DISPLAY_STORE_PATH/Icons.plist $DISPLAY_PATH/
    sudo cp $DISPLAY_STORE_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID/DisplayProductID-$DISPLAY_PRODUCT_ID* $DISPLAY_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID/
    echo 'Copy complete'
    echo
}

# Fix permission
function fixpermission() {
    echo 'Fixing permission...'
    sudo chown root:wheel $DISPLAY_PATH/Icons.plist
    sudo chown root:wheel $DISPLAY_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID*
    echo 'Fix complete'
    echo
}

# Install
function install() {
    removeold
    backup
    copy
    fixpermission
    echo 'Wonderful! This is the end of the installation, please reboot and choose 1472x828! '!'
}

# Uninstall
function uninstall() {
    echo 'Uninstalling one-key-hidpi...'
    sudo rm -rf $DISPLAY_PATH/DisplayVendorID-$DISPLAY_VENDOR_ID

    # Restore Icon.plist in backup folder if presents
    if [ -f "$DISPLAY_BACK_PATH/Icons.plist" ];then
        sudo cp -n $DISPLAY_BACK_PATH/Icons.plist $DISPLAY_PATH/
        sudo chown root:wheel $DISPLAY_PATH/Icons.plist
    fi

    # Remove backup folder
    sudo rm -rf $DISPLAY_BACK_PATH
    echo 'Uninstall complete'
}

# Main function
function main() {
    interface
    choice
    case $choose in
        1)
        install
        ;;

        2)
        uninstall
        ;;

        3)
        exit 0
        ;;

        *)
        echo "ERROR: Invalid input, the script will exit";
        exit 0
        ;;
    esac
}

main
