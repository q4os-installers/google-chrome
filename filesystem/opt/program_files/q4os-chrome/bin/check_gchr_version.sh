#!/bin/sh

STAMPFL1="/tmp/.chkgchrvrsn_$USER.stp"
if [ -f "$STAMPFL1" ] ; then
  exit
fi
touch $STAMPFL1
LAST_VER="$( kreadconfig --file "$CHROME_CFGDIR/goochrq4rc" --group "Misc" --key "LastVersion" )"
if [ "$LAST_VER" = "" ] ; then
  sleep 120 #bypass chrome initialization during the first run
else
  sleep 6
fi
CURR_VER="$( $CHROME_REAL_EXEC --version )"
if [ "$LAST_VER" != "$CURR_VER" ] ; then
  kwriteconfig --file "$CHROME_CFGDIR/goochrq4rc" --group "Misc" --key "LastVersion" "$CURR_VER"
  if [ "$LAST_VER" != "" ] ; then
    kdialog --title "" --caption "" --icon "google-chrome" --passivepopup "<font size=4><p>$LAST_VER has been updated since last run.</p><p>New version: <b>$CURR_VER</b></p></font>" 20 &
  fi
fi
rm -f $STAMPFL1
