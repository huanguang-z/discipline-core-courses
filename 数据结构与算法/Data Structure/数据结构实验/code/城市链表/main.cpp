#include <stdio.h>
#include <stdlib.h>
#include "function.h"

int main() {
	city *head, *end;
	head = (city *)malloc(sizeof(city));
	end = head;
	end->next = NULL;
	readcity(end);//���ļ��е���Ϣ����������
	printf("�����ɹ���\n");
	printf("1.��ӡ��ǰ���м���\n");
	printf("2.����һ���µĳ���\n");
	printf("3.ͨ�������ѯ����\n");
	printf("4.ͨ���������龭γ��\n");
	printf("5.ͨ����γ��ɾ������\n");
	for (;;) {
		int n;
		printf("��������Ҫ���еĲ�����\n");
		scanf("%d", &n);
		if (n == 1) {
			putall(head);

		} else if (n == 2) {
			printf("�����´����ĳ������;���γ�ȣ�");
			createnode(end);

		} else if (n == 3) {
			printf("�����ѯ���еľ��Ⱥ�γ�ȣ�");
			double x;
			double y;
			scanf("%lf%lf", &x, &y);
			check1(x, y, head);
		} else if (n == 4) {
			printf("�����ѯ���е����ƣ�");
			char nm[20];
			scanf("%s", nm);
			check2(nm, head);
		} else if (n == 5) {
			printf("����ɾ�����еľ�γ�ȣ�");
			double x, y;
			scanf("%lf%lf", &x, &y);
			citydelete(x, y, head);
		}

	}
	return 0;
}