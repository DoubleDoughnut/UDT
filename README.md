Ultimate Debian Tool v1.5 by DblD

Ultimate Debian Tool is a script that allows you to install a .deb or build a .deb, or even convert a .zip to a .deb (using dpkg -i + apt-get install -f; dpkg -b; unzip + dpkg -b commands)!

It automatically sets the permission to the "DEBIAN" folder and the control file, it also checks if there's a preinst/postinst/extrainst_ file included, and also modifies permission for those files and after that it builds a .deb

This script can make control files as well, but you need to have basic knowledge of working with debian files, so you can utilize the scripts full potential!

When converting from .zip to .deb the output file is newDeb.deb!

- Place it in /usr/bin (same directory as Rasticrac or Clutch)

- Before running, set the permissions of the script to 775 (only permission setting I tested it on)

- It needs to be run as root, the command is udt. (Thank you @ttwj for the root check suggestion!)
 
- You should respring after installing any package, just in case. (Added a prompt)

- You need to place your .deb, folder or .zip that you want to be installed/made into a .deb/converted into a .deb in /var/root.
 
- Zip files should be structured like this: https://www.dropbox.com/s/m6djhzzzdo1z8n2/Example1.png (no folder that holds DEBIAN in the other folders)!

Changelog:
- 1.0
  - Initial Release

- 1.1
  - .zip to .deb converter added (+minor bugfixes)

- 1.2
  - Fixes an issue where installing a package wouldn't install the dependencies with it

- 1.3
  - Added a prompt for a respring after installing a .deb

- 1.4
  - Added a check for postrm and prerm files (if they exist, their permissions will be set automatically)

- 1.5
  - Added Control file Maker to the script! Would add a menu for moving the file, but I'm lazy to do so
