module main;

import std.path;
import std.stdio;

pragma(lib, "ZetaBoxCommon");
pragma(lib, "ZetaBoxGraphics");
pragma(lib, "ZetaBoxSound");

import ZetaBox.Common.Loader;
import ZetaBox.Graphics.Loader;

int main (string[] args) {
	string title="ZetaBox.Graphics OpenGL test: using abstractions";

	writeln(title);
	
	
	//Window app = new Window(title, new Layout2D(
		//new Dimension2D(800, 600)
	//));
	
	//app.On!RenderingEvent(delegate (RenderingEvent e) {
		//writeln("startuped!!!");
	//});
	
	Actor2D!Screen screen=new Actor2D!Screen;

	screen._.Title=title;
	screen._.Viewport(new Layout2D(
		new Dimension2D(800, 600)
	));
	//alpha need more testing	
	screen._.AlphaBg();
	screen._.Clear(new Color(1.0, 1.0, 0.0, 1.0));
	
	screen._.PrintGLInfo();
	
	Resource!Shader triangle=new Resource!Shader("../../ZetaSpace/TriangleShaders.zrc");
	triangle.Use();
	
	
	Resource!Model model=new Resource!Model;
	
	/**
	 * Quad at center
	 */
	//triangle1
	model.Instance.AddVertex(new Position3D(-0.5, -0.5, 0));
	model.Instance.AddVertex(new Position3D(-0.5, 0.5, 0));
	model.Instance.AddVertex(new Position3D(0.5, 0.5, 0));
	//triangle2
	model.Instance.AddVertex(new Position3D(0.5, 0.5, 0));
	model.Instance.AddVertex(new Position3D(0.5, -0.5, 0));
	model.Instance.AddVertex(new Position3D(-0.5, -0.5, 0));
	
	/**
	 * Quad at top (header)
	 */
	//triangle1
	model.Instance.AddVertex(new Position3D(-1, 1, 0));
	model.Instance.AddVertex(new Position3D(1, 1, 0));
	model.Instance.AddVertex(new Position3D(-1, 0.85, 0));
	//triangle2
	model.Instance.AddVertex(new Position3D(-1, 0.85, 0));
	model.Instance.AddVertex(new Position3D(1, 1, 0));
	model.Instance.AddVertex(new Position3D(1, 0.85, 0));
	
	model.Instance.Render();
	
	screen._.Render();
	
	readln();
	return 0;
}