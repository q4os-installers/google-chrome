#!/bin/sh

#this script is intended to be forked from the prerm script

echo "Waiting for package system to be released .."
dash /usr/share/apps/q4os_system/bin/qapt_wsr.sh #waiting for apt to be safe ready
echo "Released."

if dash /usr/share/apps/q4os_system/bin/print_package_version.sh "google-chrome-stable" 1>/dev/null ; then
  echo "Chrome detected ..."
  exit
fi
#next commands need to be run after google-chrome-stable uninstall

echo "Removing possible google-chrome repos ..."
rm -f /etc/apt/sources.list.d/google-chrome*.list

#remove chrome as default tde browser - todo: need to run after chrome uninstall
echo "Unsetting Google Chrome default web browser ..."
dash /usr/share/apps/q4os_system/bin/set_default_browser.sh "_find_"
