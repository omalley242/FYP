unsigned test(unsigned a, unsigned b) {
    unsigned c = a + b; //unessecary allocation
    unsigned d = a + b; //dead-code
    return c;
}