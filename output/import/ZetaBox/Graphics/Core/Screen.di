// D import file generated from 'ZetaBox\Graphics\Core\Screen.d'
module ZetaBox.Graphics.Core.Screen;
import std.conv;
import std.string;
import ZetaBox.Graphics.Core.Actor;
import ZetaBox.Graphics.Core.Color;
import ZetaBox.Graphics.Core.GL;
import ZetaBox.Graphics.Core.Layout;
public class Screen : IActor2D
{
	private GL _runtime;

	private char* _title;

	private Layout2D _layout;

	private SDL_GLContext _context;

	private SDL_Window* _screen;

	public @property GL Runtime();


	public @property string Title();


	public @property void Title(string title);


	public @property void Layout(Layout2D layout);


	public @property Layout2D Layout();


	public this();

	public void Clear(Color color);

	public void Viewport(Layout2D layout);

	public void Render();

	public void PrintGLInfo();

}

