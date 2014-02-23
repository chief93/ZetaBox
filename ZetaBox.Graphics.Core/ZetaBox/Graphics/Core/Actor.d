module ZetaBox.Graphics.Core.Actor;

import ZetaBox.Graphics.Core.Layout;

interface IActor2D {
	public @property void Layout (Layout2D layout);
	public @property Layout2D Layout ();
}

interface IActor3D {
	public @property void Layout (Layout3D layout);
	public @property Layout3D Layout ();
}

class Actor2D (TActor) {
	private TActor _instance;
	private Actor2D!TActor[] _children;
	
	public this () {
		_instance=new TActor;
	}
	
	public this (Layout2D layout) {
		_instance=new TActor;
		_instance.Layout=layout;
	}
	
	public @property TActor Instance () { return _instance; }
	public @property Layout2D Layout () { return _instance.Layout; }
	public @property void Layout (Layout2D layout) { _instance.Layout=layout; }

	public void Attach (Actor2D actor) {
		_children~=actor;
	}
}

class Actor3D (TActor) {
	private TActor _instance;
	private Actor3D!TActor[] _children;

	public this () {
		_instance=new TActor;
	}

	public @property TActor Instance () { return _instance; }
	public @property Layout3D Layout () { return _instance.Layout; }
	public @property void Layout (Layout3D layout) { _instance.Layout=layout; }

	public void Attach (Actor3D actor) {
		_children~=actor;
	}
}