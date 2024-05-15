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

// Function to create a stack of given capacity
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

// Check if the stack is full
int isFull(struct Stack* stack) {
    return (unsigned)stack->top == stack->capacity - 1;
}

// Check if the stack is empty
int isEmpty(struct Stack* stack) {
    return stack->top == -1;
}

// Push an element onto the stack
void push(struct Stack* stack, int item) {
    if (isFull(stack)) {
        printf("Stack overflow\n");
        return;
    }
    stack->array[++stack->top] = item;
    printf("%d pushed to stack\n", item);
}

// Pop an element from the stack
int pop(struct Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack underflow\n");
        return -1;
    }
    return stack->array[stack->top--];
}

// Get the top element of the stack
int peek(struct Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return -1;
    }
    return stack->array[stack->top];
}

#endif
#endif
