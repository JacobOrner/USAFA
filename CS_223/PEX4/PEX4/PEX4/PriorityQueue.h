typedef struct queueNode{
	int v;
	int pred;
	int dist;
	struct QueueNode *next;
} *QueueNodePtr;

typedef struct queue {
	QueueNodePtr beginning;
} *QueuePtr;

// create a queue
QueuePtr initialize();

// get in line
void enqueue(QueuePtr q, int v, int dist, int pred);

// remove from the line
int dequeue(QueuePtr q, int *v, int *dist, int *pred);

// return 1 if the q is empty, 0 otherwise.
int isEmpty(QueuePtr q);

// free all the things
void freeQueue(QueuePtr q);
