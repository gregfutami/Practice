
#include <iostream>
#include "vgraphlib.h"

using namespace std;

void select_shape(){
	int selection = 0; 
	while (selection!=0){
		cout << "====================================" << endl;
		cout << "vintage v1.0 - Copyright 2015 Sora" << endl;
		cout << "Select the shape you'd like to draw:" << endl;
		cout << "1 - Vertical line" << endl;
		cout << "2 - Horizontal line" << endl;
		cout << "3 - Rectangle" << endl;
		cout << "4 - Right triangle" << endl;
		cout << "5 - Return to Main Menu" << endl;
		cout << "====================================" << endl;
		cin >> selection;
	}
}

int main(){
	int option = 0;
	int user_width = 0;
	int user_height = 0;
	while(option != 4)
	{
		cout << "====================================" << endl;
		cout << "vintage v1.0 - Copyright 2015 Sora" << endl;
		cout << "Make the following selection:" << endl;
		cout << "1 - Set up the canvas" << endl;
		cout << "2 - Select the pen" << endl;
		cout << "3 - Draw the shape" << endl;
		cout << "4 - Exit" << endl;
		cout << "====================================" << endl;
		cin >> option; 
		if(option==1){
			int input_height;
			int input_width;
			cout << "Input the canvas height you'd like to use:" << endl;
			cin >> input_height;
			cout << "Input the canvas width you'd like to use:" << endl;
			cin >> input_width;
			if(cmd_canvas_setup(input_height, input_width)){
				user_height = input_height;
				user_width = input_width;
			}

		}else if(option==2){

		}else if(option==3){

		}else if(option==4){
			cout << "Thank you. Bye now." << endl;

		}else{
			cout << "invalid options. Try again" << endl;
		}
	}
	return 1;
}