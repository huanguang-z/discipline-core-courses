#ifndef  YSF_H
#define YSF_H


#include <stdio.h>
#include <stdlib.h>
#include "ysf.h"

int main() {
	node *head, *end, *chose;
	head = (node *)malloc(sizeof(node));
	end = head;
	head->num = 1;
	end->next = NULL;
	int n;
	printf("������������");
	scanf("%d", &n);
	for (int i = 2; i <= n; i++) {
		node *c;
		c = (node *)malloc(sizeof(node));
		c->num = i;
		end->next = c;
		end = end->next;
		end->next = NULL;
	}
	end->next = head;
	chose = head;
	int m;
	printf("�������һ�����룺");
	scanf("%d", &m);
	printf("����������ÿλ�����룺");

	for (int i = 0; i < n; i++) {
		scanf("%d", &chose->key);
		chose = chose->next;
	}

	chose = head;
	printf("�˳��ı������Ϊ��");
	for (int i = 0; i < n; i++) {
		int n = del(chose, m);
		m = n;
	}

}
#endif