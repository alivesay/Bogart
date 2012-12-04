CC=clang -fblocks 

all: bogart.o example.o trie.o example

bogart.o: bogart.c bogart.h
	$(CC) -ggdb -c bogart.c -o bogart.o -I/usr/local/include/hiredis

trie.o: trie.c trie.h
	$(CC) -ggdb -c trie.c -o trie.o

example.o: example.c
	$(CC) -ggdb -c example.c -o example.o -I/usr/local/include/hiredis

example: example.o bogart.o
	$(CC) -ggdb -o example bogart.o trie.o example.o -levent -L/usr/local/lib -lhiredis -lBlocksRuntime

clean:
	rm *.o example
