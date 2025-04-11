#!/bin/sh


#################################################################################################
#########    Colorize and add text parameters       #############################################
#################################################################################################

blk=$(tput setaf 0) # black
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
ylw=$(tput setaf 3) # yellow
blu=$(tput setaf 4) # blue
mga=$(tput setaf 5) # magenta
cya=$(tput setaf 6) # cyan
wht=$(tput setaf 7) # white
#
txtbld=$(tput bold) # Bold
bldblk=${txtbld}$(tput setaf 0) # black
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldylw=${txtbld}$(tput setaf 3) # yellow
bldblu=${txtbld}$(tput setaf 4) # blue
bldmga=${txtbld}$(tput setaf 5) # magenta
bldcya=${txtbld}$(tput setaf 6) # cyan
bldwht=${txtbld}$(tput setaf 7) # white
txtrst=$(tput sgr0) # Reset

function prompt_install() {
echo
echo
echo "${bldmga}	# Installing cool-retro-term, ncmpcpp & Cava ${txtrst}"
echo
echo
sleep 2
}

function remove_previous() {
 if [ -d cava ]; then
       sudo rm -R cava/
fi

if [ -d cool-retro-term ]; then
       sudo rm -R cool-retro-term/
fi

if [ -d ncmpcpp ]; then
       sudo rm -R ncmpcpp/
fi
}

function install_deps() {
echo
echo "${bldmga}	# Install dependencies ${txtrst}"
echo
sleep 2
sudo pacman -S --needed --noconfirm yay 
yay -S --needed --noconfirm ncmpcpp-git cava-git cool-retro-term-git
}

function copy_configs() {
echo
echo "${bldmga}	# Install configs ${txtrst}"
echo
sleep 1
    if [ -f ~/.config/cava/config ]; then
       sudo rm ~/.config/cava/config
       cp -r cava.config ~/.config/cava/config
    else
        cp -r cava.config ~/.config/cava/config
    fi
 #    
    if [ -d ~/cool-retro-term ]; then
        cp -r  red.json ~/.config/cool-retro-term/
    fi
}

function check_install() {
#
#  Check install
#
    if [ -d ~/cool-retro-term ] && [ -f ~/.config/cava/config ] &&  [ -f /usr/bin/ncmpcpp ]
    then
		echo
		echo "${bldgrn}	 All Done... ${txtrst}"
		echo
		sleep 2
    else
		echo
		echo "${bldred} # Installation failed!"
		echo "...check terminal output ${txtrst}"
		echo
		sleep 2
    fi
}

prompt_install
remove_previous
install_deps
copy_configs
check_install
