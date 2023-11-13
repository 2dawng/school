#include <iostream>
#include <vector>
#include <queue>

using namespace std;

class Graph {
private:
    int numVertices;
    vector<vector<pair<int, float>>> adjList;

public:
    Graph(int n) {
        numVertices = n;
        adjList.resize(n);
    }

    void insertEdge(int s, int d, float weight) {
        adjList[s].push_back(make_pair(d, weight));
        adjList[d].push_back(make_pair(s, weight));
    }

    vector<pair<int, float>> primMST() {
        vector<bool> visited(numVertices, false);
        vector<pair<int, float>> mst;
        priority_queue<pair<float, int>, vector<pair<float, int>>, greater<pair<float, int>>> pq;

        // Bắt đầu từ đỉnh 0
        pq.push(make_pair(0, 0));

        while (!pq.empty()) {
            int u = pq.top().second;
            float weight = pq.top().first;
            pq.pop();
            
            if (visited[u])
                continue;
            
            visited[u] = true;
            mst.push_back(make_pair(u, weight));

            for (auto edge : adjList[u]) {
                int v = edge.first;
                float w = edge.second;
                
                if (!visited[v])
                    pq.push(make_pair(w, v));
            }
        }

        return mst;
    }
};

int main() {
    int numVertices;
    cout << "Enter the number of vertices: ";
    cin >> numVertices;

    Graph graph(numVertices);

    int source, destination;
    float weight;

    while (true) {
        int choice;
        cout << "Menu:\n";
        cout << "1. Insert an edge\n";
        cout << "2. Find minimum spanning tree using Prim's algorithm\n";
        cout << "3. Exit\n";
        cout << "Select an option: ";
        cin >> choice;

        switch (choice) {
            case 1:
                cout << "Enter source vertex: ";
                cin >> source;
                cout << "Enter destination vertex: ";
                cin >> destination;
                cout << "Enter weight: ";
                cin >> weight;
                graph.insertEdge(source, destination, weight);
                break;
            case 2:
                vector<pair<int, float>> mst = graph.primMST();
                cout << "Minimum Spanning Tree:\n";
                for (auto edge : mst) {
                    cout << "(" << edge.first << ", " << edge.second << ")\n";
                }
                break;
            case 3:
                return 0;
            default:
                cout << "Invalid option! Please try again.\n";
        }
    }
}
