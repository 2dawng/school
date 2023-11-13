#include <iostream>

using namespace std;

class Node
{
public:
    int vertex;
    float weight;
    Node *next;

    Node(int v, float w)
    {
        vertex = v;
        weight = w;
        next = nullptr;
    }
};

class Graph
{
private:
    int numVertices;
    Node **adjList;

public:
    Graph(int n)
    {
        numVertices = n;
        adjList = new Node *[n];
        for (int i = 0; i < n; i++)
        {
            adjList[i] = nullptr;
        }
    }

    void insertEdge(int s, int d, float weight)
    {
        // Thêm cạnh từ đỉnh nguồn đến đỉnh đích
        Node *newNode = new Node(d, weight);
        newNode->next = adjList[s];
        adjList[s] = newNode;

        // Thêm cạnh từ đỉnh đích đến đỉnh nguồn
        newNode = new Node(s, weight);
        newNode->next = adjList[d];
        adjList[d] = newNode;
    }

    void insertVertex(int name)
    {
        numVertices++;
        Node **newAdjList = new Node *[numVertices];
        for (int i = 0; i < numVertices; i++)
        {
            newAdjList[i] = (i < numVertices - 1) ? adjList[i] : nullptr;
        }
        delete[] adjList;
        adjList = newAdjList;
    }

    float getWeight(int s, int d)
    {
        Node *current = adjList[s];
        while (current != nullptr)
        {
            if (current->vertex == d)
            {
                return current->weight;
            }
            current = current->next;
        }
        return -1; // Trả về -1 nếu không tìm thấy cạnh
    }

    void print()
    {
        for (int i = 0; i < numVertices; i++)
        {
            cout << "Đỉnh " << i << ": ";
            Node *current = adjList[i];
            while (current != nullptr)
            {
                cout << "(" << current->vertex << ", " << current->weight << ") ";
                current = current->next;
            }
            cout << endl;
        }
    }
};

int main()
{
    int numVertices;
    cout << "Nhập số đỉnh: ";
    cin >> numVertices;

    Graph graph(numVertices);

    int source, destination;
    float weight;

    while (true)
    {
        int choice;
        cout << "Menu:\n";
        cout << "1. Thêm cạnh\n";
        cout << "2. Thêm đỉnh\n";
        cout << "3. Lấy trọng số của cạnh\n";
        cout << "4. In đồ thị\n";
        cout << "5. Thoát\n";
        cout << "Chọn một tùy chọn: ";
        cin >> choice;

        switch (choice)
        {
        case 1:
            cout << "Nhập đỉnh nguồn: ";
            cin >> source;
            cout << "Nhập đỉnh đích: ";
            cin >> destination;
            cout << "Nhập trọng số: ";
            cin >> weight;
            graph.insertEdge(source, destination, weight);
            break;
        case 2:
            int name;
            cout << "Nhập tên đỉnh: ";
            cin >> name;
            graph.insertVertex(name);
            break;
        case 3:
            cout << "Nhập đỉnh nguồn: ";
            cin >> source;
            cout << "Nhập đỉnh đích: ";
            cin >> destination;
            cout << "Trọng số của cạnh: " << graph.getWeight(source, destination) << endl;
            break;
        case 4:
            graph.print();
            break;
        case 5:
            return 0;
        default:
            cout << "Tùy chọn không hợp lệ! Vui lòng thử lại.\n";
        }
    }
}
