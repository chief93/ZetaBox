module ZetaBox.Core.GameObject;

import ZetaBox.Core.Positioning;

class GameObject {}

interface IObject {
	@property Position Position();
}

interface ICompoundObject {
	void Add (IObject object);
}