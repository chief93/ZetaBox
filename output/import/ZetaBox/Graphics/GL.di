// D import file generated from 'D:\dev\projects\d\ZetaBox\ZetaBox.Graphics\ZetaBox\Graphics\GL.d'
module ZetaBox.Graphics.GL;
import std.conv;
import std.path;
import std.string;
pragma (lib, buildNormalizedPath("DerelictUtil"));
pragma (lib, buildNormalizedPath("DerelictGL3"));
pragma (lib, buildNormalizedPath("DerelictGLFW3"));
pragma (lib, buildNormalizedPath("DerelictSDL2"));
public import derelict.util.loader;

public import derelict.opengl3.gl;

public import derelict.glfw3.glfw3;

public import derelict.sdl2.sdl;

import ZetaBox.Common.Loader;
class GL
{
	public @property string Vendor();


	public @property string Renderer();


	public @property string Version();


	public @property string SLVersion();


}
class Shader : IFileResource!(Shader)
{
	private GLuint _program;

	public @property GLuint Program();


	public this();

	private void _load(File source);

	public void OnLoad(File file);

	public void OnLoad(List!(File) files);

	public Shader Use();

}
interface IRenderable
{
	@property GLuint Vertices();

	void Render();
}
