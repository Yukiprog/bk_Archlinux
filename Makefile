#variables
PACMAN := sudo pacman -S 


backup: #backup current archlinux state
	mkdir -p ${PWD}/ArchLinux
	pacman -Qnq > ${PWD}/ArchLinux/pacmanlist
	pacman -Qqem > ${PWD}/ArchLinux/aurlist
