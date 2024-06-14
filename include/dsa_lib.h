#ifndef _DSA_LIB_H_
#define  _DSA_LIB_H_

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct Stack {
    int top;
    unsigned capacity;
    int* array;
} Stack;

struct Stack createStack(unsigned);
unsigned int isFull(struct Stack *__restrict);
int isEmpty(struct Stack *__restrict);
void push(struct Stack *__restrict, int);
int pop(struct Stack *__restrict);
int peek(struct Stack * __restrict);

#ifndef _DSA_LIB_H_IMPLEMTATION_

Stack createStack(unsigned int capacity) {
    Stack stack;
    stack.capacity = capacity;
    stack.top = -1;
    stack.array = (int*)malloc(stack.capacity * sizeof(int));
    if (!stack.array) {
        perror("Stack creation failed due to memory allocation error\n");
        exit(1); // Exit if memory allocation fails
    }
    return stack;
}

unsigned int isFull(struct Stack *restrict stack) {
    return (unsigned)stack->top == stack->capacity - 1;
}

int isEmpty(struct Stack *restrict stack) {
    return stack->top == -1;
}

void push(struct Stack *restrict stack, int item) {
    if (isFull(stack)) {
        printf("Stack Is Full\n");
        return;
    }
    stack->array[++stack->top] = item;
    printf("%d pushed to stack\n", item);
}

int pop(struct Stack *restrict stack) {
    if (isEmpty(stack)) {
        printf("Stack Is Empty\n");
        return -1;
    }
    return stack->array[stack->top--];
}

int peek(struct Stack *restrict stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return -1;
    }
    return stack->array[stack->top];
}

#endif // _DSA_LIB_H_IMPLEMTATION_
#endif // _DSA_LIB_H_
