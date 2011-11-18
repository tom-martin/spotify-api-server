CFLAGS = -std=c99 -Wall -I/usr/include/subversion-1
LDFLAGS = -lspotify -levent -levent_pthreads -ljansson -lsvn_diff-1 -lsvn_subr-1
SOURCES = appkey.c account.c diff.c json.c server.c

override CFLAGS += $(shell apr-1-config --cflags --cppflags --includes)

override LDFLAGS += $(shell apr-1-config --cppflags --link-ld --libs)

all: $(SOURCES) server

server:
	$(CC) $(CFLAGS) $(SOURCES) $(LDFLAGS) -g -o $@

clean:
	rm -f *.o server
	rm -rf .settings .cache

