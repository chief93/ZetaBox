module ZetaBox.Graphics.Entities;

import std.path;

pragma(lib, buildNormalizedPath("ZetaBoxCommon"));

import ZetaBox.Common.Loader;

import ZetaBox.Graphics.Layout;

interface ITexture {
	//@property byte[]
}

class Texture2D :
	IResource!Texture2D,
	IBufferResource!Texture2D,
	IFileResource!Texture2D
{
	public void OnLoad (byte[] data) { }
	
	public void OnLoad (File file) { }
	public void OnLoad (List!File files) { }
	
	public Texture2D Use () {
		return this;
	}
}

class Model3D :
	IResource!Model3D,
	IBufferResource!Model3D,
	IFileResource!Model3D
{
	public void OnLoad (byte[] data) { }
	
	public void OnLoad (File file) { }
	public void OnLoad (List!File files) { }

	public Model3D Use () {
		return this;
	}
}