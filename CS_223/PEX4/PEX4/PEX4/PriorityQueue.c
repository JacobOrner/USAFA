#include "PriorityQueue.h"
#include <stddef.h>
#include <stdlib.h>
// create a queue
QueuePtr initialize(){
	QueuePtr result = malloc(sizeof(struct queue));
	result->beginning = NULL;
	return result;
}

QueueNodePtr enqueueHelper(QueueNodePtr start, QueueNodePtr newOne){
	if (start == NULL) { // nothing there
		start = newOne;
		return start;
	}
	else if ( start->dist > newOne -> dist ) { // smaller than were at
		newOne->next = start;
		start = newOne;
		return start;
	}
	else {
		start -> next = enqueueHelper(start->next, newOne);
		return start;
	}
}

// get in line
void enqueue(QueuePtr q, int v, int dist, int pred){
	// nobody in line
	if(q->beginning == NULL){
		QueueNodePtr newOne = malloc(sizeof(struct queueNode));
		newOne -> v = v;
		newOne -> dist = dist;
		newOne -> pred = pred;
		newOne -> next = NULL;
		q -> beginning = newOne;
	}
	else {
		QueueNodePtr newOne = malloc(sizeof (struct queueNode));
		newOne -> v = v;
		newOne -> dist = dist;
		newOne -> next = NULL;
		newOne -> pred = pred;
		q->beginning = enqueueHelper( q->beginning, newOne );

	}
}

// remove from the line
int dequeue(QueuePtr q, int *v, int *dist, int *pred){
	if (q->beginning == NULL){
		return 0;
	}

	else {
		*v = q -> beginning -> v;
		*dist = q -> beginning -> dist;
		*pred = q -> beginning -> pred;
		QueueNodePtr second = q->beginning->next;
		free(q->beginning);
		q->beginning = second;
		return 1;
	}
}

// return 1 if the q is empty, 0 otherwise.
int isEmpty(QueuePtr q){
	return (q -> beginning == NULL);
}

void freeQueueHelper(QueueNodePtr qn) {
	if (qn== NULL) {
		return;
	}
	else {
		freeQueueHelper(qn->next);
		free(qn);
	}
}


// free all the things
void freeQueue(QueuePtr q){
	if (isEmpty(q)) {
		free(q);
	}
	freeQueueHelper(q->beginning);
	free(q);
}