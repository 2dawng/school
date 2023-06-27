#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void in(int a[][100], int m, int n){
	for(int i=0; i<m; i++){
		printf("\n");
		for(int j=0; j<n; j++){
			printf("%d ", a[i][j]);
		}
	}
}

void tbc(int a[][100], int m, int n){
	int tong=0;
	int dem =0;
	for(int i=0; i<m; i++){
		for(int j=0; j<n; j++){
			if(a[i][j] % 3==1 && a[i][j]%2==0){
				dem++;
				tong+=a[i][j];
			}
		}
	}
	printf("\ntbc = %.2f", (float)tong/dem);
}

void tong_hang(int a[][100], int m, int n){
	for(int i=0; i<m; i++){
		int sum=0;
		for(int j=0; j<n; j++){
			sum+=a[i][j];
		}
		printf("Tong hang %d = %d\n",i+1,sum);
	}
}

void inrafile(FILE *f2, int a[][100], int m, int n){
	for(int i=0; i<m; i++){
		fprintf(f2, "\n");
		for(int j=0; j<n; j++){
			fprintf(f2, "%d ", a[i][j]);
		}
	}
}

int main(){
	FILE *f = fopen("input81.txt", "r");
	int m, n;
	fscanf(f, "%d%d ", &m, &n);
	int a[100][100];
	for(int i=0; i<m; i++){
		for(int j=0; j<n; j++){
			fscanf(f, "%d", &a[i][j]);
		}
	}
	in(a,m,n);
	tbc(a, m, n);
	printf("\n");
	tong_hang(a,m,n);
	char file[30];
	printf("\nNhap ten file:");
	scanf("%s", file);
	FILE *f2 = fopen(file, "w");
	inrafile(f2, a, m, n);
	fclose(f);
	
}
