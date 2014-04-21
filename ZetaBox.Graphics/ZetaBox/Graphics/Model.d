module ZetaBox.Graphics.Model;

import ZetaBox.Common.Loader;

import ZetaBox.Graphics.GL;
import ZetaBox.Graphics.Layout;

class Model : IBufferResource!Model, IFileResource!Model, IRenderable {
	private GLuint _vBuffer;
	private GLfloat[] _vData;

	private GLuint _iBuffer;
	private GLuint[] _iData;

	private uint _vCount;

	public this () {
		_vCount = 0;

		glGenBuffers(1, &_vBuffer);
		glBindBuffer(GL_ARRAY_BUFFER, _vBuffer);

		glGenBuffers(1, &_iBuffer);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _iBuffer);
	}

	public void OnLoad (byte[] data) { }

	public void OnLoad (File file) { }
	public void OnLoad (List!File files) { }

	public @property GLuint Vertices () { return _vBuffer; }

	public void Render () {
		glBufferData(GL_ARRAY_BUFFER, _vData.length * float.sizeof, _vData.ptr, GL_STATIC_DRAW);
		glBufferData(GL_ELEMENT_ARRAY_BUFFER, _iData.length * float.sizeof, _iData.ptr, GL_STATIC_DRAW);

		glEnableVertexAttribArray(0);

		glBindBuffer(GL_ARRAY_BUFFER, _vBuffer);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _iBuffer);
		
		// second argument - number of vertices in SELECTED primitive
		// Ex: triangle - 3
		glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, cast(const(void*))0);
		
		// second argument - number of vertices in OUTPUT primitive
		// Ex: square - 4 (set from number of AddVertex() calls)
		glDrawElements(GL_TRIANGLES, _vCount, GL_UNSIGNED_INT, null);
		//glDrawArrays(GL_TRIANGLES, 0, _vCount);

		glDisableVertexAttribArray(0);
	}

	public Model Use () { return this; }

	public void AddVertex (Position3D position) {
		_vData~=position.x;
		_vData~=position.y;
		_vData~=position.z;

		_iData~=_vCount;

		_vCount++;
	}
}