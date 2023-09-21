#include<bits/stdc++.h>
using namespace std;
class QuadraticFunction2 {
    private:
        double a;
        double b;
        double c;

    public:
        QuadraticFunction2(double a, double b, double c) {
            this->a = a;
            this->b = b;
            this->c = c;
        }

        double calculateDiscriminant() {
            return b * b - 4 * a * c;
        }

        double calculateRoot1() {
            if(calculateDiscriminant() < 0) {
                return NAN; // Return Not-a-Number if discriminant is negative
            } else {
                return (-b + sqrt(calculateDiscriminant())) / (2 * a);
            }
        }

        double calculateRoot2() {
            if(calculateDiscriminant() < 0) {
                return NAN; // Return Not-a-Number if discriminant is negative
            } else {
                return (-b - sqrt(calculateDiscriminant())) / (2 * a);
            }
        }
};
