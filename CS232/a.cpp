#include <bits/stdc++.h>
using namespace std;

int main() {
	ios::sync_with_stdio(0);
	cin.tie(0);
	unsigned int i = 12345678;
	cout << &i << endl;
	char unsigned *c = (char unsigned *)&i;
	cout << int(*c) << " " << int(*(c + 1))<< " " << int(*(c + 2))<< " " << int(*(c + 3))  << endl;

	
	return 0;
}

