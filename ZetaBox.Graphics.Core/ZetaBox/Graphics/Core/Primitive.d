module ZetaBox.Graphics.Core.Primitive;

pragma(lib, "..\\lib\\derelict\\lib\\dmd\\DerelictUtil");
pragma(lib, "..\\lib\\derelict\\lib\\dmd\\DerelictGL3");
pragma(lib, "..\\lib\\derelict\\lib\\dmd\\DerelictGLFW3");
pragma(lib, "..\\lib\\derelict\\lib\\dmd\\DerelictSDL2");

import std.stdio;
import std.string;
import std.conv;

import derelict.util.loader;
import derelict.opengl3.gl;
import derelict.glfw3.glfw3;
import derelict.sdl2.sdl;

class Primitive {
	private GLuint vertex;

	public this () {
		writeln("hello from ZetaBox.Graphics.Core.Primitive");

		//vertex.__ctor();
		//logic();
		sdl();
	}

	private void sdl () {
		DerelictGL.load();
		DerelictSDL2.load();

		SDL_GLContext context;
		SDL_Window* window;

		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
		SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
		SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

		window=SDL_CreateWindow(
			"SDL test",
			SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
			800, 600,
			SDL_WINDOW_OPENGL | SDL_WINDOW_BORDERLESS | SDL_WINDOW_SHOWN
		);
		
		context=SDL_GL_CreateContext(window);
		DerelictGL.reload();
		//SDL_GL_SetSwapInterval(1);

		glClearColor(0.0, 0.0, 0.0, 1.0);
		glViewport(0, 0, 800, 600);

		writeln("Vendor:   ", to!string(glGetString(GL_VENDOR)));
		writeln("Renderer: ", to!string(glGetString(GL_RENDERER)));
		writeln("Version:  ", to!string(glGetString(GL_VERSION)));
		writeln("GLSL:     ", to!string(glGetString(GL_SHADING_LANGUAGE_VERSION)));
		//glClear(GL_COLOR_BUFFER_BIT);

		//GLuint vertex;
		GLfloat[] vertices=[
			-1, -1, 0,
			1, -1, 0,
			0, 1, 0,
		];
		
		//gen buffers access violation
		glGenBuffers(1, &vertex);
		glBindBuffer(GL_ARRAY_BUFFER, vertex);
		glBufferData(GL_ARRAY_BUFFER, vertices.length*float.sizeof, vertices.ptr, GL_STATIC_DRAW);

		SDL_Event e;
		while (SDL_PollEvent(&e)) {
			//writeln("poll");
			if (e.type==SDL_KEYDOWN) {
				writeln("keydown");
				break;
			};
		}

		//writeln("render");
		glEnableVertexAttribArray(0);
		glBindBuffer(GL_ARRAY_BUFFER, vertex);

		glVertexAttribPointer(
			0, // need to be equal with number in shader
			3, // number of vertices
			GL_FLOAT, // vertice type
			GL_FALSE, // is not normalized
			0, // step
			cast(const(void*))0 // offset in buffer
		);

		glDrawArrays(GL_TRIANGLES, 0, 3);
		glDisableVertexAttribArray(0);

		// need to render!
		SDL_GL_SwapWindow(window);
	}
}