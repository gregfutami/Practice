#include <iostream>

using namespace std;

int main() {
	cout << "hello world" << endl;
	int isbn_raw = 1337;
	string isbn_string = to_string(1337);
	cout << "isbn string: " <<  isbn_string << endl;

	for(int i=0; i<10; i++)
	{
		cout << "hello from interation: " << i << endl;
		//stuff
	}
} 