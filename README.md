# google-chrome
Google Chrome for Q4OS

prerequisities to build the installer:
- first read https://www.q4os.org/dqa009.html
- install q4os-devpack-base package from repositories

building the installer:
- cd into the project directory and run:
 $ dpkg-buildpackage -b -uc -us -tc
