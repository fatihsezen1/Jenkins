// tests/test_main.cpp

#include <iostream>
#include <cassert>

int add(int a, int b); // forward declaration

int main() {
    std::cout << "Running tests...\n";

    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    assert(add(0, 0) == 0);

    std::cout << "All tests passed!" << std::endl;
    return 0;
}

// Basit bir kopya, test amaçlı.
// Gerçek hayatta genelde `add` fonksiyonu ayrı bir header/source dosyasında olur.
int add(int a, int b) {
    return a + b;
}
