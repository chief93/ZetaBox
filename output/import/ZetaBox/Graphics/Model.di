// D import file generated from 'ZetaBox\Graphics\Model.d'
module ZetaBox.Graphics.Model;
import ZetaBox.Common.Loader;
import ZetaBox.Graphics.GL;
import ZetaBox.Graphics.Layout;
class Model : IBufferResource!(Model), IFileResource!(Model), IRenderable
{
	private GLuint _vBuffer;

	private GLfloat[] _vData;

	private GLuint _iBuffer;

	private GLuint[] _iData;

	private uint _vCount;

	public this();

	public void OnLoad(byte[] data);

	public void OnLoad(File file);

	public void OnLoad(List!(File) files);

	public @property GLuint Vertices();


	public void Render();

	public Model Use();

	public void AddVertex(Position3D position);

}
