NAME = dsa
VERSION = 0.0.1
PREFIX ?= $(HOME)/.local

CC ?= gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -Wno-unused-parameter -Wshadow -std=c99

SRC = lib/dsa.c lib/macros.c src/main.c
OBJ = $(SRC:%.c=%.o)
INCLUDE = -Iinclude 

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(CFLAGS) $(INCLUDE)

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
