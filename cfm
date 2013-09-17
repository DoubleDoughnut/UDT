#!/bin/bash
#1.0 by DblD
#I was bored again...
#To-Do: nothing.
# ???
#PROFIT.
# ..... Are you root? If you aren't, GTFO!
if [ $UID -ne 0 ]; then
   echo "Please run as root!"
   exit 1
fi
# ..... Wut iz dis?
cd
# ..... Need to check if no control files are present
# ..... If a control file exists it will be overwritten or backed up depending on what the user chooses
if [ -e /var/root/control ]; then
echo "A control file already exists in /var/root!"
echo "Do you want to back it up?"
read -p "Back it up - y / Overwrite - n / Exit (so you can move it manually) - anything else : " choice
case "$choice" in 
  y|Y ) echo "Backing it up..."
  mv /var/root/control /var/root/control.bak
  echo "Backed up to control.bak, next time you choose backup, this file (control.bak) will be overwritten!"
                        ;;
  n|N ) echo "It will be overwritten!"
                        ;;
  * ) exit 1;;
esac
fi
# ..... Need user input 'cuz this script has no AI! (no l33t hacks, no swag)
# ..... Functions for 20% more swag
function pkgnamef {
echo -n "Package name (e.g. domain.sitename.packagename): "
read pkgname
if [ -z $pkgname ]; then
echo "This field must not be empty!"
pkgnamef
fi
}
pkgnamef
function rpkgnamef {
echo -n "Package name (real name): "
read rpkgname
if [ -z $rpkgname ]; then
echo "This field must not be empty!"
rpkgnamef
fi
}
rpkgnamef
function verf {
echo -n "Version: "
read ver
if [ -z $ver ]; then
echo "This field must not be empty!"
verf
fi
}
verf
function descf {
echo -n "Description: "
read desc
if [ -z $desc ]; then
echo "This field must not be empty!"
descf
fi
}
descf
function maintf {
echo -n "Maintainer: "
read maint
if [ -z $maint ]; then
echo "This field must not be empty!"
maintf
fi
}
maintf
function authf {
echo -n "Author: "
read auth
if [ -z $auth ]; then
echo "This field must not be empty!"
authf
fi
}
authf
# ..... Only two user inputs can be empty!
echo -n "Conflicts (optional, e.g. com.firstpackageIdont.like, com.secondpackageIdont.like): "
read conf
echo -n "Depends (optional, same format as conflicts, but you need these packages): "
read dep
# ..... writing user input in the control file
echo "Package: $pkgname" > /var/root/control
echo "Name: $rpkgname" >> /var/root/control
echo "Version: $ver" >> /var/root/control
# ..... It looks like this script has a brain # ..... after all
echo "Architecture: iphoneos-arm" >> /var/root/control
echo "Description: $desc" >> /var/root/control
echo "Maintainer: $maint" >> /var/root/control
echo "Author: $auth" >> /var/root/control
echo "Conflicts: $conf" >> /var/root/control
echo "Depends: $dep" >> /var/root/control
# ..... Modifying permissions
chmod 775 /var/root/control
# ..... Done
echo "Done, your control file is located in /var/root"
# ..... Money in the bank, pimpin' ain't easy!
# ..... Max swag level reached (over 9000)!
exit 1