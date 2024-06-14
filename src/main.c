#include <typedef.h>
#include <dsa_lib.h>
#include <macros.h>
#include <log.h>

#include <stdio.h>

int main(void) {
	printf("Hello, World!\n");
	Stack stack = createStack(8);
	for (int i = 0; i < 8; i++) {
		if (isFull(&stack)) { 
			perror("Stack is full");
			break;
		}
		push(&stack, 1);
	}
	return 0;
}
