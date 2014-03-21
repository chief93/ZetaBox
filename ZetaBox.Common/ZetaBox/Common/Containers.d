module ZetaBox.Common.Containers;

import ZetaBox.Common.Loader;

interface IResource (TResource) {
	TResource Use ();
}

interface IBufferResource (TResource) : IResource!TResource {
	void OnLoad (byte[] data);
}

interface IFileResource (TResource) : IResource!TResource {
	void OnLoad (File file);
	void OnLoad (List!File files);
}

class Resource (TResource) {
	private TResource _resource;
	
	public @property TResource Instance () { return _resource; }

	public this () {
		_resource=new TResource;
	}

	public this (byte[] data) {
		_resource=new TResource;
		Load(data);
	}

	public this (string path) {
		_resource=new TResource;
		Load(path);
	}

	public void Load (byte[] data) {
		IBufferResource!TResource resource=cast(IBufferResource!TResource)_resource;

		resource.OnLoad(data);
	}

	public void Load (string path) {
		IFileResource!TResource resource=cast(IFileResource!TResource)_resource;

		if (path.length < 4 || path[path.length - 4 ..$] != ".zrc") resource.OnLoad(new File(path));
		else resource.OnLoad(File.ListDirectory(path));
	}

	public TResource Use () {
		return _resource.Use();
	}
}