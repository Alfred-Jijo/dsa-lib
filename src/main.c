#include <typedef.h>
#include <dsa_lib.h>
#include <macros.h>
#include <log.h>

#include <stdio.h>

static const int STACK_CAPACITY = 8;

static void stackTesting(Stack *);

int main(void) {
	Stack stack = createStack(STACK_CAPACITY);
	stackTesting(&stack);
	printf("Hello, World!\n");
	return 0;
}

static void stackTesting(Stack *pStack) {

	for (int i = 0; i < STACK_CAPACITY; i++) {
		if (isFull(pStack)) { 
			perror("Stack is full");
			break;
		}
		push(pStack, i);
	}

	push(pStack, 8);

	for (int i = 0; i < STACK_CAPACITY; i++) {
		printf("%d\n", pop(pStack));
	}

}
