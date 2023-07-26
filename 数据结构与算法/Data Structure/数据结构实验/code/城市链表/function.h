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


int readcity(city *&end) { //读入城市信息，并储存在链表中
	FILE *fp = fopen("city.txt", "a+");


	while (fscanf(fp, "%s %lf %lf\n", &end->name, &end->jd, &end->wd) != EOF) {//尾插增加新城市
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




void createnode(city *&end) { //创建一个城市结点
	city *pou;
	pou = (city *)malloc(sizeof(city));

	end->next = pou;
	scanf("%s", end->name);
	scanf("%lf%lf", &end->jd, &end -> wd);
	end = pou;
	end->next = NULL;

}

void putall(city *c) {//打印所有的城市信息

	for (;;) {
		printf("城市名称：%s,经度：%lf,纬度：%lf\n", c->name, c->jd, c->wd);
		c = c->next;
		if (c->next == NULL) {
			break;
		}
	}


}

void check1(int x, int y, city *c) {//通过经纬度查询城市信息
	int jud = 0;
	for (;;) {
		if (c->jd == x && c->wd == y) {
			printf("查询到城市为：%s\n", c->name);
			jud = 1;
			break;
		} else {
			c = c->next;
		}
		if (c->next == NULL)
			break;
	}
	if (jud == 0) {
		printf("未查询到该城市！\n");
	}
}

void check2(char a[], city *c) {//通过城市名查询城市信息
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
			printf("查找的城市经纬度为：%lf,%lf\n", c->jd, c->wd);
			break;
		} else {
			c = c->next;
		}
	}
	if (jud == 0) {
		printf("未查询到该城市！\n");
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
		printf("本不存在该城市！\n");
	} else if (jud == 1) {
		printf("删除成功！");
	}

}

#endif