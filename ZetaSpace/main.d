module main;

pragma(lib, "..\\output\\lib\\ZetaBoxCommon.lib");
pragma(lib, "..\\output\\lib\\ZetaBoxGraphicsCore.lib");
pragma(lib, "..\\output\\lib\\ZetaBoxSimulationMath.lib");

import std.stdio;
import ZetaBox.Graphics.Core.Primitive;
import ZetaBox.Common.Collections.Dictionary;
import ZetaBox.Common.Collections.KeyValuePair;
import ZetaBox.Simulation.Math.Point;
import ZetaBox.Simulation.Math.Vector;

int main (string[] args) {
	writeln("Hello World!");
	Primitive primitive=new Primitive();

	Point a=new Point(0, 0, 0);
	Point b=new Point(8, 8, 8);
	Vector dir=new Vector(a, b);
	writeln("testing dir: ", dir.GetLength());
	Dictionary!(string,string) dict=new Dictionary!(string,string)();
	dict.Set("hello", "world");
	writeln("dict: ", dict.Get("hello"));
	readln();
	return 0;
}