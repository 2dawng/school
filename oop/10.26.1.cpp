#include <bits/stdc++.h>
using namespace std;

class Circle {
private:
    float x;
    float y;
    float r;

public:
    Circle(float x, float y, float r) {
        this->x = x;
        this->y = y;
        this->r = r;
    }

    void input() {
        cout << "Nhập tọa độ x: ";
        cin >> x;
        cout << "Nhập tọa độ y: ";
        cin >> y;
        cout << "Nhập bán kính r: ";
        cin >> r;
    }

    friend istream& operator>>(istream& input, Circle& circle) {
        cout << "Nhập tọa độ x: ";
        cin >> x;
        cout << "Nhập a độ y: ";
        cin >> y;
        cout << "Nhập bán kính r: ";
        cin >> r;
    }

    void output() {
        cout << "Tâm: (" << x << ", " << y << ")" << endl;
        cout << "Bán kính: " << r << endl;
    }

    float area() {
        return M_PI * r * r;
    }

    bool GocPhanTuThu2() {
        return (x + r < 0 && y - r > 0);
    }
};

class Color : public Circle {
private:
    int color;

public:
    Color(float x, float y, float r, int color) : Circle(x, y, r) {
        this->color = color;
    }

    int getColor() {
        return color;
    }

    static bool compareArea(Color c1, Color c2) {
        return c1.area() > c2.area();
    }
};

int main() {
    vector<Color> circles;

    int n;
    cout << "Nhap so hinh tron: ";
    cin >> n;

    for (int i = 0; i < n; i++) {
        float x, y, r;
        int color;

        cout << "Circle " << i+1 << ":" << endl;
        cout << "Enter x coordinate: ";
        cin >> x;
        cout << "Enter y coordinate: ";
        cin >> y;
        cout << "Enter r: ";
        cin >> r;
        cout << "Enter color (1:red, 2:green, 3:yellow): ";
        cin >> color;

        Color circle(x, y, r, color);
        circles.push_back(circle);
    }

    sort(circles.begin(), circles.end(), Color::compareArea);

    cout << "Circles in descending order of area:" << endl;
    for (Color circle : circles) {
        circle.output();
        cout << "Area: " << circle.area() << endl;
        cout << "Color: " << circle.getColor() << endl;
        cout << endl;
    }

    int redMaxAreaIndex = -1;
    float maxArea = 0.0;

    int greenCount = 0;
    int yellowCount = 0;

    for (int i = 0; i < n; i++) {
        Color circle = circles[i];

        if (circle.getColor() == 1 && circle.area() > maxArea) {
            redMaxAreaIndex = i;
            maxArea = circle.area();
        }

        if (circle.getColor() == 2) {
            greenCount++;
        } else if (circle.getColor() == 3) {
            yellowCount++;
        }
    }

    cout << "Red circle with the largest area:" << endl;
    if (redMaxAreaIndex != -1) {
        circles[redMaxAreaIndex].output();
        cout << "Area: " << circles[redMaxAreaIndex].area() << endl;
        cout << "Color: " << circles[redMaxAreaIndex].getColor() << endl;
    } else {
        cout << "No red circles found." << endl;
    }

    cout << endl;

    cout << "Number of green circles: " << greenCount << endl;
    cout << "Number of yellow circles: " << yellowCount << endl;

    if (greenCount > yellowCount) {
        cout << "There are more green circles than yellow circles." << endl;
    } else {
        cout << "There are not more green circles than yellow circles." << endl;
    }

    return 0;
}
