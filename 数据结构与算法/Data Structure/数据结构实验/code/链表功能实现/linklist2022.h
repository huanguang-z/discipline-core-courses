#ifndef  _LINKLIST2022_H_
#define _LINKLIST2022_H_


#include <stdio.h>
#include <stdlib.h>
typedef int Status;/* Status�Ǻ���������,��ֵ�Ǻ������״̬���룬��OK�� */

typedef struct Node {
	int  data;
	struct Node *next;
} LinkList;
/* ����LinkList */


/* ��ʼ����ʽ���Ա� */
//Status InitList(LinkList *L) {
//	L = (LinkList *)malloc(sizeof(LinkList)); /* ����ͷ���,��ʹLָ���ͷ��� */
//
//	L->next = NULL; /* ָ����Ϊ�� */

//	return 1;
//}

/* ��ʼ��������ʽ���Ա�L�Ѵ��ڡ������������LΪ�ձ��򷵻�TRUE�����򷵻�FALSE */
int  ListEmpty(LinkList *L) {
	if (L->next == NULL)
		return 0;
	else
		return 1;
}

/* ��ʼ��������ʽ���Ա�L�Ѵ��ڡ������������L����Ϊ�ձ� */
void ClearList(LinkList *&list) {
	LinkList *p, *q;
	p = list->next;         /*  pָ���һ����� */
	while (p != NULL) {           /*  û����β */
		q = p->next;
		free(p);
		p = q;
	}
	list->next = NULL;      /* ͷ���ָ����Ϊ�� */

}

/* ��ʼ��������ʽ���Ա�L�Ѵ��ڡ��������������L������Ԫ�ظ��� */
int ListLength(LinkList *L) {
	int i = 1;
	LinkList *p ;
	p = L->next; /* pָ���һ����� */
	for (;;) {
		i++;
		p = p->next;
		if (p->next == NULL)
			break;
	}
	return i;
}

/* ��ʼ��������ʽ���Ա�L�Ѵ���,1��i��ListLength(L)�� */
/* �����������L�е�i��λ��֮ǰ�����µ�����Ԫ��e��L�ĳ��ȼ�1 */
Status ListInsert(LinkList *&L, int i, int e) {
	int j;
	LinkList *p, *s;
	p = (LinkList *)malloc(sizeof(LinkList));
	p = L;
	j = 1;
	while (p && j < i) {   /* Ѱ�ҵ�i����� */
		p = p->next;
		++j;
	}
	if (!p || j > i)
		return 0;   /* ��i��Ԫ�ز����� */
	s = (LinkList *)malloc(sizeof(LinkList));
	/*  �����½��(C���Ա�׼����) */

	s->data = e;
	s->next = p->next;      /* ��p�ĺ�̽�㸳ֵ��s�ĺ��  */
	p->next = s;          /* ��s��ֵ��p�ĺ�� */
	return 1;
}

/* ��ʼ��������ʽ���Ա�L�Ѵ��ڣ�1��i��ListLength(L) */
/* ���������ɾ��L�ĵ�i������Ԫ�أ�L�ĳ��ȼ�1 */
Status ListDelete(LinkList *&L, int i) {
	int j;
	LinkList *p, *q;
	p = L;
	j = 1;
	while (p->next && j < i) {	/* ����Ѱ�ҵ�i��Ԫ�� */
		p = p->next;
		++j;
	}
	if (!(p->next) || j > i)
		return 0;           /* ��i��Ԫ�ز����� */
	q = p->next;
	p->next = q->next;			/* ��q�ĺ�̸�ֵ��p�ĺ�� */
	free(q);                    /* ��ϵͳ���մ˽�㣬�ͷ��ڴ� */
	return 1;
}

/* ��ʼ��������ʽ���Ա�L�Ѵ��� */
/* ������������ζ�L��ÿ������Ԫ����� */
Status ListTraverse(LinkList *L) {
	LinkList *pi ;
	pi = (LinkList *)malloc(sizeof(LinkList));
	pi = L;
	for (;;) {

		printf("%d\n", pi->data);

		if (pi->next == NULL)
			break;
		pi = pi->next;
	}
	printf("\n");
	return 0;
}
#endif
