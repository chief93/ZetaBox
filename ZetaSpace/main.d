module main;

pragma(lib, "..\\ZetaBox.Graphics.Core\\bin\\Debug\\libZetaBox.lib");

import std.stdio;
import ZetaBox.Graphics.Core.Primitive;

int main (string[] args) {
	writeln("Hello World!");
	Primitive primitive=new Primitive();

	readln();
	return 0;
}