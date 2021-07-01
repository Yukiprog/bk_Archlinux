#variables

#26packages
BASE_PKGS := filesystem gcc-libs glibc bash coreutils file findutils gawk
BASE_PKGS += grep procps-ng sed tar gettext pciutils psmisc shadow
BASE_PKGS += util-linux bzip2 gzip xz licenses pacman systemd systemd-sysvcompat
BASE_PKGS += iputils iproute2

#24packages
BASE_DEVEL_PKGS := autoconf automake binutils bison fakeroot file findutils flex
BASE_DEVEL_PKGS += gawk gcc gettext grep groff gzip libtool m4
BASE_DEVEL_PKGS += make pacman patch pkgconf sed sudo texinfo which

PACMAN := sudo pacman -S
SYSTEMD_ENABLE := sudo systemctl --now enable

base: #installing base packages
	$(PACMAN) $(BASE_PKGS)

base_devel: #installing base_devel packages
	$(PACMAN) $(BASE_DEVEL_PKGS)

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
