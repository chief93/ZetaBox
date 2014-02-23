module main;

import std.path;
import std.stdio;

pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxCommon"));
pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxGraphicsCore"));
pragma(lib, buildNormalizedPath("../output/lib/ZetaBoxSimulationMath"));

import ZetaBox.Common.Collections;
import ZetaBox.Common.Containers;

import ZetaBox.Graphics.Core.Actor;
import ZetaBox.Graphics.Core.Color;
import ZetaBox.Graphics.Core.Layout;
import ZetaBox.Graphics.Core.Model;
import ZetaBox.Graphics.Core.Screen;

import ZetaBox.Simulation.Math.Point;
import ZetaBox.Simulation.Math.Vector;

int main (string[] args) {
	string title="ZetaBox.Graphics OpenGL test: using abstractions";

	writeln(title);

	Layout2D viewport=new Layout2D;
	viewport.Dimension.x=800;
	viewport.Dimension.y=600;

	Actor2D!Screen screen=new Actor2D!Screen;

	screen.Instance.Title=title;
	screen.Instance.Viewport(viewport);
	screen.Instance.Clear(new Color(1.0, 1.0, 0.0));

	screen.Instance.PrintGLInfo();

	Resource!Model model=new Resource!Model;
	model.Instance.AddVertex(new Position3D(-1, -1, 0));
	model.Instance.AddVertex(new Position3D(1, -1, 0));
	model.Instance.AddVertex(new Position3D(0, 1, 0));
	model.Instance.Render();
	
	screen.Instance.Render();

	readln();
	return 0;
}