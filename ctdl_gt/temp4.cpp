#include <iostream>

using namespace std;

// Định nghĩa cấu trúc cho đỉnh trong đồ thị
struct Vertex {
    int value;
    struct Edge* next;
};

// Định nghĩa cấu trúc cho cung trong đồ thị
struct Edge {
    int destination;
    float weight;
    struct Edge* next;
};

class Graph {
private:
    int numVertices; // Số đỉnh
    Vertex* vertices; // Mảng các đỉnh

public:
    // Khởi tạo đồ thị ban đầu rỗng
    Graph(int n) {
        numVertices = n;
        vertices = new Vertex[n + 1]; // Vì đỉnh được đánh số từ 1 đến n
        for (int i = 1; i <= n; i++) {
            vertices[i].value = i;
            vertices[i].next = nullptr;
        }
    }

    // Bổ sung một cung vào đồ thị
    void insertEdge(int s, int d, float weight) {
        Edge* edge = new Edge;
        edge->destination = d;
        edge->weight = weight;
        edge->next = vertices[s].next;
        vertices[s].next = edge;

        edge = new Edge;
        edge->destination = s;
        edge->weight = weight;
        edge->next = vertices[d].next;
        vertices[d].next = edge;
    }

    // Thêm một đỉnh mới vào đồ thị
    void insertVertex() {
        numVertices++;
        Vertex* temp = new Vertex[numVertices + 1];
        for (int i = 1; i <= numVertices - 1; i++) {
            temp[i] = vertices[i];
        }
        temp[numVertices].value = numVertices;
        temp[numVertices].next = nullptr;
        delete[] vertices;
        vertices = temp;
    }

    // Lấy trọng số của một cung
    float getWeight(int s, int d) {
        Edge* edge = vertices[s].next;
        while (edge != nullptr) {
            if (edge->destination == d) {
                return edge->weight;
            }
            edge = edge->next;
        }
        return -1; // Trả về -1 nếu không tìm thấy cung
    }

    // Hiển thị đồ thị
    void print() {
        for (int i = 1; i <= numVertices; i++) {
            cout << "Đỉnh " << i << ": ";
            Edge* edge = vertices[i].next;
            while (edge != nullptr) {
                cout << "(" << edge->destination << ", " << edge->weight << ") ";
                edge = edge->next;
            }
            cout << endl;
        }
    }
};

int main() {
    Graph graph(6);
    graph.insertEdge(1, 2, 5.0);
    graph.insertEdge(1, 3, 2.5);
    graph.insertEdge(2, 4, 3.8);
    graph.insertEdge(3, 4, 1.2);
    graph.insertEdge(4, 5, 4.7);
    graph.insertVertex();

    graph.print();

    return 0;
}
