#include <stdio.h>
#include <stdlib.h>

typedef struct cir {
	int num;
	int key;
	struct cir *next;
} node;

int del(node *&c, int m) {
	m = m - 1;//Ҫ�ҵ�����֮���m�����Ļ�����Ҫ����m-1λ
	for (; m > 0; m--) {
		c = c->next;
	}
	node *mid;
	int number;
	number = c->num;
	int time = c->key;
	mid = c;
	for (;;) {
		c = c->next;
		if (c->next == mid)
			break;
	}
	c->next = mid->next;
	free(mid);
	c = c->next;
	printf("%d ", number);
	return time;
}