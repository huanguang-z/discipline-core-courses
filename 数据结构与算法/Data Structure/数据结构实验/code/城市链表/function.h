#ifndef  FUNCTION_H
#define FUNCTION_H


#include <stdio.h>
#include <string.h>
#include <stdlib.h>


typedef struct stu {
	char name[12];
	double jd;
	double wd;
	struct stu *next;
} city;


int readcity(city *&end) { //���������Ϣ����������������
	FILE *fp = fopen("city.txt", "a+");


	while (fscanf(fp, "%s %lf %lf\n", &end->name, &end->jd, &end->wd) != EOF) {//β�������³���
		city *p ;
		p = (city *)malloc(sizeof(city));

		//	p->next = NULL;
		end->next = p;

		end = p;
		end->next = NULL;
		//free(p);


	}

	fclose(fp);
	return 1;
}




void createnode(city *&end) { //����һ�����н��
	city *pou;
	pou = (city *)malloc(sizeof(city));

	end->next = pou;
	scanf("%s", end->name);
	scanf("%lf%lf", &end->jd, &end -> wd);
	end = pou;
	end->next = NULL;

}

void putall(city *c) {//��ӡ���еĳ�����Ϣ

	for (;;) {
		printf("�������ƣ�%s,���ȣ�%lf,γ�ȣ�%lf\n", c->name, c->jd, c->wd);
		c = c->next;
		if (c->next == NULL) {
			break;
		}
	}


}

void check1(int x, int y, city *c) {//ͨ����γ�Ȳ�ѯ������Ϣ
	int jud = 0;
	for (;;) {
		if (c->jd == x && c->wd == y) {
			printf("��ѯ������Ϊ��%s\n", c->name);
			jud = 1;
			break;
		} else {
			c = c->next;
		}
		if (c->next == NULL)
			break;
	}
	if (jud == 0) {
		printf("δ��ѯ���ó��У�\n");
	}
}

void check2(char a[], city *c) {//ͨ����������ѯ������Ϣ
	int jud = 0;
	for (;;) {
		for (int i = 0; i < 5; i++) {
			if (a[i] != c->name[i]) {
				break;
			}
			if (i == 4) {
				jud = 1;
			}
		}
		if (jud = 1) {
			printf("���ҵĳ��о�γ��Ϊ��%lf,%lf\n", c->jd, c->wd);
			break;
		} else {
			c = c->next;
		}
	}
	if (jud == 0) {
		printf("δ��ѯ���ó��У�\n");
	}
}

void citydelete(int x, int y, city *&head) {
	city *del, *mid;
	int jud = 0;


	del = head;
	for (;;) {
		if (del->jd == x && del->wd == y) {
			mid = del;
			del = del->next;
			free(mid);
			jud = 1;

		} else {
			del = del->next;
		}
		if (del->next == NULL)
			break;
	}
	if (jud == 0) {
		printf("�������ڸó��У�\n");
	} else if (jud == 1) {
		printf("ɾ���ɹ���");
	}

}

#endif