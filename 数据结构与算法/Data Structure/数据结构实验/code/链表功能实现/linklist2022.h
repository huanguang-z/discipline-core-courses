#ifndef  _LINKLIST2022_H_
#define _LINKLIST2022_H_


#include <stdio.h>
#include <stdlib.h>
typedef int Status;/* Status是函数的类型,其值是函数结果状态代码，如OK等 */

typedef struct Node {
	int  data;
	struct Node *next;
} LinkList;
/* 定义LinkList */


/* 初始化链式线性表 */
//Status InitList(LinkList *L) {
//	L = (LinkList *)malloc(sizeof(LinkList)); /* 产生头结点,并使L指向此头结点 */
//
//	L->next = NULL; /* 指针域为空 */

//	return 1;
//}

/* 初始条件：链式线性表L已存在。操作结果：若L为空表，则返回TRUE，否则返回FALSE */
int  ListEmpty(LinkList *L) {
	if (L->next == NULL)
		return 0;
	else
		return 1;
}

/* 初始条件：链式线性表L已存在。操作结果：将L重置为空表 */
void ClearList(LinkList *&list) {
	LinkList *p, *q;
	p = list->next;         /*  p指向第一个结点 */
	while (p != NULL) {           /*  没到表尾 */
		q = p->next;
		free(p);
		p = q;
	}
	list->next = NULL;      /* 头结点指针域为空 */

}

/* 初始条件：链式线性表L已存在。操作结果：返回L中数据元素个数 */
int ListLength(LinkList *L) {
	int i = 1;
	LinkList *p ;
	p = L->next; /* p指向第一个结点 */
	for (;;) {
		i++;
		p = p->next;
		if (p->next == NULL)
			break;
	}
	return i;
}

/* 初始条件：链式线性表L已存在,1≤i≤ListLength(L)， */
/* 操作结果：在L中第i个位置之前插入新的数据元素e，L的长度加1 */
Status ListInsert(LinkList *&L, int i, int e) {
	int j;
	LinkList *p, *s;
	p = (LinkList *)malloc(sizeof(LinkList));
	p = L;
	j = 1;
	while (p && j < i) {   /* 寻找第i个结点 */
		p = p->next;
		++j;
	}
	if (!p || j > i)
		return 0;   /* 第i个元素不存在 */
	s = (LinkList *)malloc(sizeof(LinkList));
	/*  生成新结点(C语言标准函数) */

	s->data = e;
	s->next = p->next;      /* 将p的后继结点赋值给s的后继  */
	p->next = s;          /* 将s赋值给p的后继 */
	return 1;
}

/* 初始条件：链式线性表L已存在，1≤i≤ListLength(L) */
/* 操作结果：删除L的第i个数据元素，L的长度减1 */
Status ListDelete(LinkList *&L, int i) {
	int j;
	LinkList *p, *q;
	p = L;
	j = 1;
	while (p->next && j < i) {	/* 遍历寻找第i个元素 */
		p = p->next;
		++j;
	}
	if (!(p->next) || j > i)
		return 0;           /* 第i个元素不存在 */
	q = p->next;
	p->next = q->next;			/* 将q的后继赋值给p的后继 */
	free(q);                    /* 让系统回收此结点，释放内存 */
	return 1;
}

/* 初始条件：链式线性表L已存在 */
/* 操作结果：依次对L的每个数据元素输出 */
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
