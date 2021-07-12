#variables
PACMAN := sudo pacman -S
PACMAN_UPDATE := sudo pacman -Syy
SYSTEMD_ENABLE := sudo systemctl --now enable

#PACKAGES :=

#26packages
BASE_PKGS := filesystem gcc-libs glibc bash coreutils file findutils gawk
BASE_PKGS += grep procps-ng sed tar gettext pciutils psmisc shadow
BASE_PKGS += util-linux bzip2 gzip xz licenses pacman systemd systemd-sysvcompat
BASE_PKGS += iputils iproute2

#24packages
BASE_DEVEL_PKGS := autoconf automake binutils bison fakeroot file findutils flex
BASE_DEVEL_PKGS += gawk gcc gettext grep groff gzip libtool m4
BASE_DEVEL_PKGS += make pacman patch pkgconf sed sudo texinfo which

update_pacman:
	$(PACMAN_UPDATE)

#backup etc...
backup: #backup current archlinux state
	mkdir -p ${PWD}/ArchLinux
	pacman -Qnq > ${PWD}/ArchLinux/pacmanlist
	pacman -Qqem > ${PWD}/ArchLinux/aurlist

#basic etc...
base: #installing base packages
	$(PACMAN) $(BASE_PKGS)

base_devel: #installing base_devel packages
	$(PACMAN) $(BASE_DEVEL_PKGS)

#app etc...
urxvt: # Init rxvt-unicode terminal
	$(PACMAN) rxvt-unicode
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources

dzdoom: # on the assumption,  Installing yay and Existing rar file in Files directory. Considering later...
	yay -S brutal-doom
	$(PACMAN) unrar
	unrar e ${PWD}/Files/brutalv21.rar
	sudo mv ${PWD}/Files/DOOM.WAD ${PWD}/Files/DOOM2.WAD ${PWD}/Files/PLUTONIA.WAD /usr/share/games/brutal-doom/
	sudo mv /usr/share/games/brutal-doom/brutal-doom.pk3 /usr/share/games/brutal-doom/brutal-doom_ori.pk3
	sudo mv ${PWD}/Files/brutal-doom.pk3 /usr/share/games/brutal-doom/brutal-doom.pk3
	test -L ${HOME}/.config/gzdoom || rm -rf ${HOME}/.config/gzdoom
	ln -vsfn ${PWD}/.config/gzdoom ${HOME}/.config/gzdoom

emacs: #installing emacs
	$(PACMAN) $@
	test -L ${HOME}/.emacs.d || rm -rf ${HOME}/.emacs.d
	ln -vsfn ${PWD}/.emacs.d ${HOME}/.emacs.d

#creating test env etc...
docker: # initial setup(exexute enable and start)
	$(PACMAN) $@
	sudo usermod -aG docker ${USER}
	$(SYSTEMD_ENABLE) $@.service

docker_image: docker
	docker build -t dotfiles ${PWD}

testbackup: docker_image # Test this Makefile with mount backup directory
	docker run -it --name make$@ -v ${HOME}/bk_Archlinux:${HOME}/bk_Archlinux:cached --name makefiletest -d dotfiles:latest /bin/bash

appinstall: update_pacman urxvt dzdoom emacs
create_docker: docker docker_image testbackup
