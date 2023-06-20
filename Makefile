VERSION=627.40.1

CFLAGS := -g3 -Wall -I$(PWD)/include -D_FILE_OFFSET_BITS=64 -DLINUX=1 -DBSD=1 -DVERSION=\"$(VERSION)\"
LDFLAGS := -Wl,--build-id
SUBDIRS := newfs_hfs fsck_hfs

all clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d -f Makefile $@; done

dist: clean
	-mkdir hfs-$(VERSION)
	cp -a $(SUBDIRS) Makefile include hfs-$(VERSION)
	tar zcf hfs-$(VERSION).tar.gz hfs-$(VERSION)

export CC CFLAGS LDFLAGS
