#variables
PACMAN := sudo pacman -S
SYSTEMD_ENABLE := sudo systemctl --now enable

docker: # initial setup(exexute enable and start)
	$(PACMAN) $@
	sudo usermod -aG docker ${USER}
	$(SYSTEMD_ENABLE) $@.service

backup: #backup current archlinux state
	mkdir -p ${PWD}/ArchLinux
	pacman -Qnq > ${PWD}/ArchLinux/pacmanlist
	pacman -Qqem > ${PWD}/ArchLinux/aurlist

docker_image: docker
	docker build -t dotfiles ${PWD}

testbackup: docker_image # Test this Makefile with mount backup directory
	docker run -it --name make$@ -v /home/${USER}/bk_Archlinux:${HOME}/:cached --name makefiletest -d dotfiles:latest /bin/bash
