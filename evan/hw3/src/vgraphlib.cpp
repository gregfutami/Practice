#include <iostream>
#include "vgraphlib.h"

using namespace std;

bool cmd_canvas_setup (int &height, int &width){

	if(width > CANVAS_WIDTH || width < 1){
		cout << "Width must be between 0 and 50" << endl;
		return false;
	}else if (height > CANVAS_HEIGHT || height < 1){
		cout << "Height must be between 0 and 40" << endl;
		return false;
	}
	return true;
}
bool cmd_pen_selection (char &pen);
bool cmd_draw_vertical_line (char pen, int height);
bool cmd_draw_horizontal_line (char pen, int width);
bool cmd_draw_rectangle (char pen, char type, int height, int width);
bool cmd_draw_right_triangle (char pen, char type, int width);