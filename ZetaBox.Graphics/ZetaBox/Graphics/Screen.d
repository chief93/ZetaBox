module ZetaBox.Graphics.Screen;

import std.conv;
import std.string;

import ZetaBox.Graphics.Actor;
import ZetaBox.Graphics.Color;
import ZetaBox.Graphics.GL;
import ZetaBox.Graphics.Layout;

public class Screen : IActor2D {
	private GL _runtime;
	private char* _title;
	private Layout2D _layout;

	private SDL_GLContext _context;
	private SDL_Window* _screen;

	public @property GL Runtime () { return _runtime; }

	public @property string Title () { return to!string(_title); }
	public @property void Title (string title) { _title=cast(char*)title; }
	
	public @property void Layout (Layout2D layout) { _layout=layout; }
	public @property Layout2D Layout () { return _layout; }

	public this () {
		_runtime=new GL;
		_layout=new Layout2D;

		DerelictGL.load();
		DerelictSDL2.load();
		
		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
		SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
		SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
	}

	public void Clear (Color color) {
		//glColorMask(true, true, true, false);
		glClearColor(color.Red, color.Green, color.Blue, color.Alpha);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	}

	public void Viewport (Layout2D layout) {
		_layout=layout;

		_screen=SDL_CreateWindow(
			_title,
			SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
			cast(int)_layout.Dimension.x, cast(int)_layout.Dimension.y,
			SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN | SDL_WINDOW_BORDERLESS
		);
		
		_context=SDL_GL_CreateContext(_screen);
		DerelictGL.reload();

		glViewport(
			cast(GLint)_layout.Position.x,
			cast(GLint)_layout.Position.y,
			cast(GLsizei)_layout.Dimension.x,
			cast(GLsizei)_layout.Dimension.y
		);
	}
	
	public void AlphaBg () {
		glEnable(GL_ALPHA_TEST);
		glEnable(GL_DEPTH_TEST);
		glEnable(GL_COLOR_MATERIAL);
		
		glEnable(GL_LIGHTING);
		glEnable(GL_LIGHT0);
		
		glEnable(GL_BLEND);
		
		glBlendFunc(GL_DST_ALPHA, GL_ONE_MINUS_DST_ALPHA);
	}

	public void Render () {
		SDL_GL_SwapWindow(_screen);
	}

	public void PrintGLInfo () {
		std.stdio.writeln();
		std.stdio.writeln("+--- OpenGL Info -------------------------------------------+");
		std.stdio.writeln("| Video vendor:   ", leftJustify(_runtime.Vendor, 41),    " |");
		std.stdio.writeln("| Video renderer: ", leftJustify(_runtime.Renderer, 41),  " |");
		std.stdio.writeln("| GL version:     ", leftJustify(_runtime.Version, 41),   " |");
		std.stdio.writeln("| SL version:     ", leftJustify(_runtime.SLVersion, 41), " |");
		std.stdio.writeln("+-----------------------------------------------------------+");
	}
}