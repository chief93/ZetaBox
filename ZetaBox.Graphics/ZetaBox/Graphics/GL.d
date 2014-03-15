module ZetaBox.Graphics.GL;

import std.conv;
import std.path;
import std.string;

pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelictUtil"));
pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelictGL3"));
pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelictGLFW3"));
pragma(lib, buildNormalizedPath("../lib/derelict/lib/dmd/DerelictSDL2"));

public import derelict.util.loader;
public import derelict.opengl3.gl;
public import derelict.glfw3.glfw3;
public import derelict.sdl2.sdl;

import ZetaBox.Common.Loader;

class GL {
	public @property string Vendor () { return to!string(glGetString(GL_VENDOR)); }
	public @property string Renderer () { return to!string(glGetString(GL_RENDERER)); }
	public @property string Version () { return to!string(glGetString(GL_VERSION)); }
	public @property string SLVersion () { return to!string(glGetString(GL_SHADING_LANGUAGE_VERSION)); }
}

class Shader : IFileResource!Shader {
	private GLuint _program;

	public @property GLuint Program () { return _program; }

	public this () {
		_program=glCreateProgram();
	}

	private void _load (File source) {
		GLuint shader;
		bool ok = true;

		switch (source.Extension) {
			case "glfs": shader=glCreateShader(GL_FRAGMENT_SHADER); break;
			case "glvs": shader=glCreateShader(GL_VERTEX_SHADER); break;
			default: ok = false; break;
		}

		if (!ok) return;

		const(char)* src=cast(const(char)*)source.Data;

		glShaderSource(shader, 1, &src, null);
		glCompileShader(shader);
		glAttachShader(_program, shader);
	}

	public void OnLoad (File file) {
		_load(file);

		glLinkProgram(_program);
	}

	public void OnLoad (List!File files) {
		foreach (file; files) _load(file);

		glLinkProgram(_program);


		int ok;
		glGetProgramiv(_program, GL_LINK_STATUS, &ok);
		
		if (!ok) std.stdio.writeln("ERROR linking glsl: ", ok);
	}

	public Shader Use () {
		glUseProgram(_program);

		return this;
	}
}

interface IRenderable {
	@property GLuint Vertices ();
	void Render ();
}