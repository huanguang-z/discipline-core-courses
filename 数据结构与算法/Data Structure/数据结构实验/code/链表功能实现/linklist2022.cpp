
#include <stdlib.h>
#include <stdio.h>
#include "linklist2022.h"




int main() {
	int m, n;
	printf("请输入链表长度：");
	scanf("%d", &m);
	LinkList *head, *end;
	head = (LinkList *)malloc(sizeof(LinkList));
//	end = (LinkList *)malloc(sizeof(LinkList));

	head->next = NULL;
	head->data = 0;
	end = head;
//	p = head;
	for (int i = 0; i < m; i++) {
		int da;
		printf("输入该节点的元素：");
		scanf("%d", &da);
		LinkList *p;
		p = (LinkList *)malloc(sizeof(LinkList));

		p->data = da;
		end->next = p;
		end = p;

		//	end->next = NULL;


	}
	end->next = NULL;
	/*
	LinkList *pu;
	pu = (LinkList *)malloc(sizeof(LinkList));
	pu = head;
	for (;;) {
		printf("%d\n", pu->data);
		if (pu->next == NULL) {
			break;
		}

		pu = pu->next;




	}*/

	for (;;) {
		printf("请输入要执行的操作：\n");
		printf("1.检查链表是否为空\n");
		printf("2.输出链表元素个数\n");
		printf("3.在第i个元素前插入e这个元素\n");
		printf("4.删除第i个数据元素\n");
		printf("5.打印链表\n");
		printf("6.将链表置为空表\n");
		scanf("%d", &n);
		if (n == 1) {
			int jud = ListEmpty(head);
			if (jud == 0) {
				printf("链表为空\n");
			} else if (jud == 1) {
				printf("链表非空\n");
			}
		} else if (n == 2) {
			int len = ListLength(head);
			printf("链表长度为：%d\n", len);
		} else if (n == 3) {
			int a1, a2;
			printf("输入插入位置和插入元素\n");
			scanf("%d%d", &a1, &a2);
			ListInsert(head, a1, a2);
		} else if (n == 4) {
			int a3;
			printf("输入要删除的元素位置\n");
			ListDelete(head, a3);
		} else if (n == 5) {
			ListTraverse(head->next) ;
		} else if (n == 6) {
			ClearList(head);
			break;
		}

	}
	return 0;
}