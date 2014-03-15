module ZetaBox.Common.IO;

import std.conv;
import std.file;
import std.path;
import std.string;

import ZetaBox.Common.Loader;

class File {
	private string _name;
	private byte[] _data;

	public @property string Name () { return _name; }
	public @property string Extension () { return _name[(_name.lastIndexOf('.')+1)..$]; }
	public @property byte[] Data () { return _data; }

	public this () { }
	public this (string path) {
		Read(path);
	}

	public void Read (string path) {
		_name=path;
		_data=cast(byte[])read(path);
	}


	public static List!File ListDirectory (string path) {
		List!File output=new List!File;

		auto files=dirEntries(path, SpanMode.depth);
		
		foreach (file; files)
			output.Add(new File(buildNormalizedPath(path, file.name)));

		return output;
	}
}