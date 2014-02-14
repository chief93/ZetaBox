module ZetaBox.Graphics.Core.Primitive;

//can't compile, need absolute path. Now I'm searching how to determine it
//pragma(lib, "DerelictGL3");
pragma(lib, "D:\\dev\\projects\\d\\ZetaBox\\ZetaBox.Graphics.Core\\lib\\lib\\dmd\\DerelictGL3.lib");
pragma(lib, "D:\\dev\\projects\\d\\ZetaBox\\ZetaBox.Graphics.Core\\lib\\lib\\dmd\\DerelictGLFW3.lib");
pragma(lib, "D:\\dev\\projects\\d\\ZetaBox\\ZetaBox.Graphics.Core\\lib\\lib\\dmd\\DerelictUtil.lib"); 
pragma(lib, "D:\\dev\\projects\\d\\ZetaBox\\ZetaBox.Graphics.Core\\lib\\lib\\dmd\\dl.lib");

import std.stdio;
import derelict.opengl3.gl;
import derelict.glfw3.glfw3;

class Primitive {
	public this () {
		writeln("hello from ZetaBox.Graphics.Core.Primitive");

		//
		if (glfwInit())
			writeln("OpenGL initialized!!!");
	}
}