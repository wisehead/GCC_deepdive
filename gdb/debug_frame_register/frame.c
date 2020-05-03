int f() {
    return 1;
}

int g(int i, int j) {
    int l1 = 1;
    int l2 = 2;
    int l3 = 3;
    l3 = l2 + l1;
    l3 = i*l3 + j;
    return l3;
}

int main(int argc, char *argv[]) {
    int i, j;
    int k = 2;
    i = f();
    j = g(i,k);
    return i*j;
}
