// D import file generated from 'ZetaBox\Common\Containers.d'
module ZetaBox.Common.Containers;
import ZetaBox.Common.Collections;
import ZetaBox.Common.IO;
class Containers
{
}
template IResource(TResource)
{
	interface IResource
	{
		TResource Use();

	}
}
template IBufferResource(TResource)
{
	interface IBufferResource : IResource!(TResource)
	{
		void OnLoad(byte[] data);

	}
}
template IFileResource(TResource)
{
	interface IFileResource : IResource!(TResource)
	{
		void OnLoad(File file);

		void OnLoad(List!(File) files);

	}
}
template Resource(TResource)
{
	class Resource
	{
		private TResource _resource;

		public @property TResource Instance()
		{
			return _resource;
		}



		public this()
		{
			_resource = new TResource;
		}


		public this(byte[] data)
		{
			_resource = new TResource;
			Load(data);
		}


		public this(string path)
		{
			_resource = new TResource;
			Load(path);
		}


		public void Load(byte[] data)
		{
			IBufferResource!(TResource) resource = cast(IBufferResource!(TResource))_resource;
			resource.OnLoad(data);
		}


		public void Load(string path)
		{
			IFileResource!(TResource) resource = cast(IFileResource!(TResource))_resource;
			if (path.length < 4 || path[path.length - 4..$] != ".zrc")
				resource.OnLoad(new File(path));
			else
				resource.OnLoad(File.ListDirectory(path));
		}


		public TResource Use()
		{
			return _resource.Use();
		}


	}
}
