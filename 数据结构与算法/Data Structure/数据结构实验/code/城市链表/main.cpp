#include <stdio.h>
#include <stdlib.h>
#include "function.h"

int main() {
	city *head, *end;
	head = (city *)malloc(sizeof(city));
	end = head;
	end->next = NULL;
	readcity(end);//将文件中的信息读进链表中
	printf("创建成功！\n");
	printf("1.打印当前城市集合\n");
	printf("2.创建一个新的城市\n");
	printf("3.通过坐标查询城市\n");
	printf("4.通过城市名查经纬度\n");
	printf("5.通过经纬度删除城市\n");
	for (;;) {
		int n;
		printf("请输入您要进行的操作：\n");
		scanf("%d", &n);
		if (n == 1) {
			putall(head);

		} else if (n == 2) {
			printf("输入新创建的城市名和经度纬度：");
			createnode(end);

		} else if (n == 3) {
			printf("输入查询城市的经度和纬度：");
			double x;
			double y;
			scanf("%lf%lf", &x, &y);
			check1(x, y, head);
		} else if (n == 4) {
			printf("输入查询城市的名称：");
			char nm[20];
			scanf("%s", nm);
			check2(nm, head);
		} else if (n == 5) {
			printf("输入删除城市的经纬度：");
			double x, y;
			scanf("%lf%lf", &x, &y);
			citydelete(x, y, head);
		}

	}
	return 0;
}