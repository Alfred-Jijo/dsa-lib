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
int isFull(struct Stack*);
int isEmpty(struct Stack*);
void push(struct Stack*, int);
int pop(struct Stack*);
int peek(struct Stack*);

#ifndef _DSA_LIB_H_IMPLEMTATION_

Stack createStack(unsigned capacity) {
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

int isFull(struct Stack* stack) {
    return (unsigned)stack->top == stack->capacity - 1;
}

int isEmpty(struct Stack* stack) {
    return stack->top == -1;
}

void push(struct Stack* stack, int item) {
    if (isFull(stack)) {
        printf("Stack overflow\n");
        return;
    }
    stack->array[++stack->top] = item;
    printf("%d pushed to stack\n", item);
}

int pop(struct Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack underflow\n");
        return -1;
    }
    return stack->array[stack->top--];
}

int peek(struct Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return -1;
    }
    return stack->array[stack->top];
}

#endif
#endif
