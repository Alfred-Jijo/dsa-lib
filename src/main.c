#include <typedef.h>
#include <dsa_lib.h>
#include <macros.h>
#include <log.h>

#include <stdio.h>

static const int STACK_CAPACITY = 8;

int main(void) {
	printf("Hello, World!\n");
	Stack stack = createStack(STACK_CAPACITY);

	for (int i = 0; i < STACK_CAPACITY; i++) {
		if (isFull(&stack)) { 
			perror("Stack is full");
			break;
		}
		push(&stack, i);
	}

	push(&stack, 8);

	for (int i = 0; i < STACK_CAPACITY; i++) {
		printf("%d\n", pop(&stack));
	}
	return 0;
}
