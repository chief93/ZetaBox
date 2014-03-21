module main;

import std.path;
import std.stdio;

//pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxCommon"));
//pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxGraphics"));
//pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxSound"));

//pragma(lib, buildNormalizedPath("DerelictUtil"));
//pragma(lib, buildNormalizedPath("DerelictGL3"));
//pragma(lib, buildNormalizedPath("DerelictGLFW3"));
//pragma(lib, buildNormalizedPath("DerelictSDL2"));

pragma(lib, buildNormalizedPath("ZetaBoxCommon"));
pragma(lib, buildNormalizedPath("ZetaBoxGraphics"));
pragma(lib, buildNormalizedPath("ZetaBoxSound"));

//pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelictUtil"));
//pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelicGL3"));
//pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelicGLFW3"));
//pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelicSDL2"));

import ZetaBox.Common.Loader;
import ZetaBox.Graphics.Loader;

int main (string[] args) {
	string title="ZetaBox.Graphics OpenGL test: using abstractions";

	writeln(title);
	
	Actor2D!Screen screen=new Actor2D!Screen;

	screen._.Title=title;
	screen._.Viewport(new Layout2D(
		new Dimension2D(800, 600)
	));
	screen._.Clear(new Color(1.0, 1.0, 0.0));

	screen._.PrintGLInfo();

	Resource!Shader triangle=new Resource!Shader("D:\\dev\\projects\\d\\ZetaBox\\ZetaSpace\\TriangleShaders.zrc");
	triangle.Use();

	/*
	Resource!Model model=new Resource!Model;
	model.Instance.AddVertex(new Position3D(-1, -1, 0));
	model.Instance.AddVertex(new Position3D(1, -1, 0));
	model.Instance.AddVertex(new Position3D(0, 1, 0));
	model.Instance.Render();
	*/
	Resource!Model model=new Resource!Model;
	model.Instance.AddVertex(new Position3D(-0.5, -0.5, 0));
	model.Instance.AddVertex(new Position3D(-0.5, 0.5, 0));
	model.Instance.AddVertex(new Position3D(0.5, 0.5, 0));
	model.Instance.AddVertex(new Position3D(0.5, -0.5, 0));
	model.Instance.Render();
	/*
	Resource!Model model1=new Resource!Model;
	model1.Instance.AddVertex(new Position3D(-1, 1, 0));
	model1.Instance.AddVertex(new Position3D(1, 0, 0));
	model1.Instance.AddVertex(new Position3D(-1, -1, 0));
	model1.Instance.Render();
	*/
	
	//Hello world
	//so, saving by hotkey... RIGHT NOW!!11
	//SAVING ONLY THAT FILE
	//saving all with gl.d
	//only gl
	
	screen._.Render();

	readln();
	return 0;
}