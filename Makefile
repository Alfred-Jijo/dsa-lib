NAME = dsa
VERSION = 0.0.1
PREFIX ?= $(HOME)/.local

CC ?= gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -Wno-unused-parameter -Wshadow -std=c99
LOGFLAGS = -DLOG_USE_COLOR

SRC = lib/dsa.c lib/log/src/log.c lib/macros.c src/main.c
OBJ = $(SRC:%.c=%.o)
INCLUDE = -Iinclude -Ilib/log/src

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(CFLAGS) $(LOGFLAGS) $(INCLUDE)

.c.o:
	$(CC) -c $< -o $@ $(CFLAGS) $(INCLUDE)

run: $(NAME)
	./$(NAME)

asm:
	gcc -O3 -S src/main.c -o output.asm $(INCLUDE)

clean:
	$(RM) $(OBJ)
	$(RM) $(NAME)

.PHONY: all clean
