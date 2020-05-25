CFLAGS = -std=gnu99 -g -Wall

all: tiny

tiny: tiny.o
	$(CC) $(CFLAGS) tiny.o -o tiny

tiny.o: tiny.c
	$(CC) $(CFLAGS)  -c tiny.c -o tiny.o

clean:
	rm -f *.tiny

