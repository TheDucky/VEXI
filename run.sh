#! /bin/bash

NC='\033[0m'
B='\033[34m'

echo -e "${B}############################\n##${NC}   Welcome to VEXI!     ${B}##\n############################${NC}"
echo -e " ${B}V${NC}Scode ${B}Ex${NC}tension ${B}I${NC}nstaller\n"

touch ExtensionInstaller.sh
getDate=$(date)
echo -e '#! /bin/bash\n\necho "(THE STORED EXTENSIONS WILL START TO INSTALL)"\n' > ExtensionInstaller.sh
sleep 1
packages=$(code --list-extensions | xargs -L 1 echo code --install-extension >> ExtensionInstaller.sh)
echo -e '\necho "(TASK COMPLETE!)"\n# backup created on: ' $getDate >> ExtensionInstaller.sh
echo -e 'ExtensionInstaller.sh has been created!\n'

read -p 'Would you like to backup settings.json as well? (Y/N): ' getSettings
echo ''
if [ "${getSettings^^}" = "Y" ]; then
	mkdir VEXI_backup
	mv ExtensionInstaller.sh VEXI_backup
	cp /home/$USER/.config/Code/User/settings.json settings.json
	mv settings.json VEXI_backup
	zip -r VEXI_backup.zip VEXI_backup
	rm -r VEXI_backup
	echo -e "\nALL DONE :)\nsettings.json and ExtensionInstaller.sh stored in VEXI_backup.zip"

elif [ "${getSettings^^}" = "N" ]; then
	echo -e "\nALL DONE :)\nExtensionInstaller.sh has been created!"

else 
	echo 'That wasent a Yes or a No. :('
fi