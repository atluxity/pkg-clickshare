DESTDIR =
prefix = /usr
bindir = $(prefix)/bin
sysconfdir = /etc
docdir = $(prefix)/share/doc/clickshare
udevdir = /lib/udev/rules.d

INSTALL = install -m755
INSTALL_DATA = install -m644

all:

install:
	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(docdir)
	$(INSTALL_DATA) README clickshare-eula $(DESTDIR)$(docdir)
	$(INSTALL) bin/clickshare-launcher bin/clickshare $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(udevdir)
	$(INSTALL_DATA) ./udev/99-clickshare.rules $(DESTDIR)$(udevdir)