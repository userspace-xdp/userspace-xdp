CC = gcc
CFLAGS = -Wall -Wextra -std=c99
TARGET = test_hash

all: $(TARGET)

$(TARGET): test_hash.o
	$(CC) $(CFLAGS) -o $(TARGET) test_hash.o

test_hash.o: test_hash.c hash_map.h
	$(CC) $(CFLAGS) -c test_hash.c

clean:
	rm -f *.o $(TARGET)

.PHONY: all clean
