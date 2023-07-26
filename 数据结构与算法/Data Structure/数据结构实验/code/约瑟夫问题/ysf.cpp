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
	printf("请输入总数：");
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
	printf("请输入第一个密码：");
	scanf("%d", &m);
	printf("请依次输入每位的密码：");

	for (int i = 0; i < n; i++) {
		scanf("%d", &chose->key);
		chose = chose->next;
	}

	chose = head;
	printf("退出的编号依次为：");
	for (int i = 0; i < n; i++) {
		int n = del(chose, m);
		m = n;
	}

}
#endif