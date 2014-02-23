// D import file generated from 'ZetaBox\Common\IO.d'
module ZetaBox.Common.IO;
import std.conv;
import std.file;
import std.path;
import std.string;
import ZetaBox.Common.Collections;
class IO
{
}
class File
{
	private string _name;

	private byte[] _data;

	public @property string Name();


	public @property string Extension();


	public @property byte[] Data();


	public this();

	public this(string path);

	public void Read(string path);

	public static List!(File) ListDirectory(string path);


}
