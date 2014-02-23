// D import file generated from 'ZetaBox\Graphics\Core\Model.d'
module ZetaBox.Graphics.Core.Model;
import ZetaBox.Common.Collections;
import ZetaBox.Common.Containers;
import ZetaBox.Common.IO;
import ZetaBox.Graphics.Core.GL;
import ZetaBox.Graphics.Core.Layout;
class Model : IBufferResource!(Model), IFileResource!(Model), IRenderable
{
	private GLuint _vBuffer;

	private GLfloat[] _vData;

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
