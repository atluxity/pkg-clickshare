DESTDIR =
prefix = /usr
bindir = $(prefix)/bin
sysconfdir = /etc
docdir = $(prefix)/share/doc/clickshare
udevdir = /lib/udev/rules.d
barco = $(prefix)/share/barco
applications = $(prefix)/share/applications
autostart = /etc/xdg/autostart

arch = $(shell dpkg --print-architecture)

INSTALL = install -m755
INSTALL_DATA = install -m644

all:

install:
	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(docdir)
	$(INSTALL_DATA) README clickshare-eula $(DESTDIR)$(docdir)
	$(INSTALL) bin-$(arch)/clickshare-launcher bin-$(arch)/clickshare $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(udevdir)
	$(INSTALL_DATA) udev/99-clickshare.rules $(DESTDIR)$(udevdir)
	mkdir -p $(DESTDIR)$(barco)
	$(INSTALL_DATA) barco/clickshare.svg barco/trayicon_red.png barco/trayicon_gray.png barco/clickshare.ico barco/trayicon_white.png $(DESTDIR)$(barco)
	mkdir -p $(DESTDIR)$(applications)
	$(INSTALL_DATA) desktop/clickshare.desktop $(DESTDIR)$(applications)
	mkdir -p $(DESTDIR)$(autostart)
	$(INSTALL_DATA) desktop/clickshare-launcher.desktop $(DESTDIR)$(autostart)
