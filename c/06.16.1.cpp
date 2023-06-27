#include <stdio.h>
#include <math.h>
#include <algorithm>

struct point {
    double x, y;
};

bool sortx(const point& lhs, const point& rhs) {
    return lhs.x < rhs.x;
}

bool sorty(const point& lhs, const point& rhs) {
    return lhs.y < rhs.y;
}

int factorial(int a){
    int ans = 1;
    for (int i = 2; i <= a; i++)
        ans *= i;
    return ans;
}

int main() {
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);
    
    int num_points;
    scanf("%d", &num_points);
    
    point* arr = new point[num_points];

    double distance, max_distance = 0.0, farthest_x, farthest_y;
    int count = 0;
    
    for(int i = 0; i < num_points; i++) {
        scanf("%lf %lf", &arr[i].x, &arr[i].y);
        distance = arr[i].x*arr[i].x + arr[i].y*arr[i].y;
        if(distance > max_distance) {
            max_distance = distance;
            farthest_x = arr[i].x;
            farthest_y = arr[i].y;
        }
        if(arr[i].x < 0 && arr[i].y < 0)count++;
    }
    std::sort(arr, arr + num_points, sortx);
    int ix, iy;
    for(int i = 0; i < num_points; i++)
        if(arr[i].x >= 0){
            ix = i;
            break;
        }
    std::sort(arr, arr + ix, sorty);
    for(int i = 0; i < ix; i++)
        if(arr[i].y >= 0){
            iy = i;
            break;
        }
    for(int i = 0; i < iy; i++)
        printf("%lf %lf\n", arr[i].x, arr[i].y);
    printf("Diem xa nhat: (%lf, %lf)\nCo %d doan thang nam trong goc phan tu thu 3",
    farthest_x, farthest_y, factorial(count)/(factorial(count - 2) * 2));

}
