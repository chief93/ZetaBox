// D import file generated from 'ZetaBox\Graphics\Core\Primitive.d'
module ZetaBox.Graphics.Core.Primitive;
import std.stdio;
import std.string;
import std.conv;
import ZetaBox.Graphics.Core.GL;
class Primitive
{
	private GLuint vertex;

	private SDL_GLContext context;

	private SDL_Window* window;

	public this();

	public void viewport();

	public void clear();

	public void info();

	public void model();

	public void render();

}
