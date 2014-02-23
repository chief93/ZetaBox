module ZetaBox.Graphics.Core.Camera;

import ZetaBox.Graphics.Core.Actor;
import ZetaBox.Graphics.Core.Layout;

class Camera3D : IActor3D {
	private Layout3D _layout;

	public @property void Layout (Layout3D layout) { _layout=layout; }
	public @property Layout3D Layout () { return _layout; }

	public this () {
		_layout=new Layout3D;
	}
}