#include <iostream>
#include <queue>
#include <unordered_map>
using namespace std;

class HuffmanNode {
public:
    char data;
    unsigned frequency;
    HuffmanNode *left, *right;
    
    HuffmanNode(char data, unsigned frequency)
    {
        left = right = nullptr;
        this->data = data;
        this->frequency = frequency;
    }
};

struct compare {
    bool operator()(HuffmanNode* l, HuffmanNode* r)
    {
        return (l->frequency > r->frequency);
    }
};

class HuffmanCoding {
public:
    unordered_map<char, string> codes;

    void printCodes(HuffmanNode* root, string str)
    {
        if (!root)
            return;
        
        if (root->data != '$')
            cout << root->data << ": " << str << "\n";

        printCodes(root->left, str + "0");
        printCodes(root->right, str + "1");
    }

    void encode(HuffmanNode* root, string str, unordered_map<char, string>& huffmanCode)
    {
        if (root == nullptr)
            return;

        if (!root->left && !root->right) {
            huffmanCode[root->data] = str;
        }

        encode(root->left, str + "0", huffmanCode);
        encode(root->right, str + "1", huffmanCode);
    }

    HuffmanNode* buildHuffmanTree(string text)
    {
        unordered_map<char, int> freq;
        for (char ch : text) {
            freq[ch]++;
        }

        priority_queue<HuffmanNode*, vector<HuffmanNode*>, compare> pq;
        for (auto pair : freq) {
            pq.push(new HuffmanNode(pair.first, pair.second));
        }

        while (pq.size() != 1) {
            HuffmanNode *left = pq.top();
            pq.pop();
            HuffmanNode *right = pq.top();
            pq.pop();

            HuffmanNode *top = new HuffmanNode('$', left->frequency + right->frequency);
            top->left = left;
            top->right = right;
            pq.push(top);
        }

        return pq.top();
    }

    string compress(string text)
    {
        string compressedText = "";
        HuffmanNode* root = buildHuffmanTree(text);
        encode(root, "", codes);

        for (char ch : text) {
            compressedText += codes[ch];
        }

        return compressedText;
    }

    string decompress(string compressedText, HuffmanNode* root)
    {
        string decompressedText = "";
        HuffmanNode* curr = root;
        
        for (char ch : compressedText) {
            if (ch == '0') {
                curr = curr->left;
            }
            else {
                curr = curr->right;
            }

            if (!curr->left && !curr->right) {
                decompressedText += curr->data;
                curr = root;
            }
        }

        return decompressedText;
    }
};

int main()
{
    HuffmanCoding h;
    string text;
    cout << "Nhập chuỗi ký tự: ";
    cin >> text;

    string compressedText = h.compress(text);
    cout << "Chuỗi ký tự đã nén: " << compressedText << "\n";

    string decompressedText = h.decompress(compressedText, h.buildHuffmanTree(text));
    cout << "Chuỗi ký tự đã giải nén: " << decompressedText << "\n";

    return 0;
}
