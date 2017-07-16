/*
 ============================================================================
 Name        : bubblesort.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define SIZE 10

void printList( const int nums[SIZE])
{
	printf("[");
	for(int i = 0; i < SIZE ; ++i)
		{
			printf(" %d",nums[i]);
		}
	printf(" ]\n");
}

void bubbleSort(int nums[SIZE])
{
	for(int i = 0; i < SIZE ; ++i)
	{
		for(int j = 0; j < (SIZE-i) -1 ; ++j)
		{
			if(nums[j] > nums[j+1])
			{
				int temp;
				temp = nums[j];
				nums[j] = nums[j+1];
				nums[j+1] = temp;
			}
		}
		printList(nums);
	}
}

void assertSort(const int nums[SIZE])
{
	for(int i = 0; i < SIZE -1 ; ++i)
	{
		assert(nums[i] <= nums[i+1]);
	}
}

int main(void) {

	int nums[SIZE];

	puts("Enter 10 numbers for sorting.\n ");

	for(int i = 0; i < SIZE ; ++i)
	{
		scanf("%d",&nums[i]);
	}

	printList(nums);

	bubbleSort(nums);

	printList(nums);

	//check the array if it is sorted
	assertSort(nums);

	uts("Array sorted.\n ");

	return EXIT_SUCCESS;
}
