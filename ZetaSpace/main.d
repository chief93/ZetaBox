module main;

pragma(lib, "..\\ZetaBox.Graphics.Core\\bin\\Debug\\libZetaBox.lib");
pragma(lib, "..\\ZetaBox.Simulation.Math\\bin\\Debug\\ZetaBox.lib");

import std.stdio;
import ZetaBox.Graphics.Core.Primitive;

import ZetaBox.Simulation.Math.Point;
import ZetaBox.Simulation.Math.Vector;

int main (string[] args) {
	writeln("Hello World!");
	Primitive primitive=new Primitive();

	Point a=new Point(0, 0, 0);
	Point b=new Point(4, 4, 0);
	Vector dir=new Vector(a, b);
	writeln("testing dir: ", dir.GetLength());
	//Dictionary!(string,string) dict=new Dictionary!(string,string)();

	readln();
	return 0;
}