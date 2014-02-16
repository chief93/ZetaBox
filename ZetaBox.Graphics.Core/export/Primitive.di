// D import file generated from 'ZetaBox\Graphics\Core\Primitive.d'
module ZetaBox.Graphics.Core.Primitive;
pragma (lib, "..\\ZetaBox.Graphics.Core\\import\\derelict\\lib\\dmd\\DerelictUtil.lib");
pragma (lib, "..\\ZetaBox.Graphics.Core\\import\\derelict\\lib\\dmd\\DerelictGL3");
pragma (lib, "..\\ZetaBox.Graphics.Core\\import\\derelict\\lib\\dmd\\DerelictGLFW3");
pragma (lib, "..\\ZetaBox.Graphics.Core\\import\\derelict\\lib\\dmd\\DerelictSDL2");
import std.stdio;
import std.string;
import std.conv;
import derelict.util.loader;
import derelict.opengl3.gl;
import derelict.glfw3.glfw3;
import derelict.sdl2.sdl;
template KeyValuePair(TKey, TValue)
{
	class KeyValuePair
	{
		TKey Key;
		TValue Value;
	}
}
template Dictionary(TKey, TValue)
{
	class Dictionary
	{
		KeyValuePair[] _cache;
		public this()
		{
		}


	}
}
class Primitive
{
	private GLuint vertex;

	public this();

	private void sdl();

}
