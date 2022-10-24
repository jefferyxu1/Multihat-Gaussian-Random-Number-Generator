#include "multihat.h"
#include <iostream>
using namespace std;

int main() {

	int result[30];
    for (int i = 0; i < 30; i++) {
        result[i] = int(multihat());
        cout << result[i];
    }
    return 0;
}
