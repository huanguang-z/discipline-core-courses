
#include <stdlib.h>
#include <stdio.h>
#include "linklist2022.h"




int main() {
	int m, n;
	printf("�����������ȣ�");
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
		printf("����ýڵ��Ԫ�أ�");
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
		printf("������Ҫִ�еĲ�����\n");
		printf("1.��������Ƿ�Ϊ��\n");
		printf("2.�������Ԫ�ظ���\n");
		printf("3.�ڵ�i��Ԫ��ǰ����e���Ԫ��\n");
		printf("4.ɾ����i������Ԫ��\n");
		printf("5.��ӡ����\n");
		printf("6.��������Ϊ�ձ�\n");
		scanf("%d", &n);
		if (n == 1) {
			int jud = ListEmpty(head);
			if (jud == 0) {
				printf("����Ϊ��\n");
			} else if (jud == 1) {
				printf("����ǿ�\n");
			}
		} else if (n == 2) {
			int len = ListLength(head);
			printf("������Ϊ��%d\n", len);
		} else if (n == 3) {
			int a1, a2;
			printf("�������λ�úͲ���Ԫ��\n");
			scanf("%d%d", &a1, &a2);
			ListInsert(head, a1, a2);
		} else if (n == 4) {
			int a3;
			printf("����Ҫɾ����Ԫ��λ��\n");
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