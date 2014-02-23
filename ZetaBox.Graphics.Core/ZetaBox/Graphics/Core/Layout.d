module ZetaBox.Graphics.Core.Layout;

class Axis2D {
	public float x;
	public float y;
}

class Axis3D {
	public float x;
	public float y;
	public float z;
}

class Position2D : Axis2D {
	public this () {
		x = 0;
		y = 0;
	}
	
	public this (float x, float y) {
		this.x = x;
		this.y = y;
	}
}

class Position3D : Axis3D {
	public this () {
		x = 0;
		y = 0;
		z = 0;
	}

	public this (float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
}

class Rotation2D : Axis2D {
}

class Rotation3D : Axis3D {
}

class Dimension2D : Axis2D {
}

class Dimension3D : Axis3D {
}

class Layout {}

class Layout2D {
	public Position2D Position;
	public Rotation2D Rotation;
	public Dimension2D Dimension;

	public this () {
		Position=new Position2D;
		Rotation=new Rotation2D;
		Dimension=new Dimension2D;
	}
}

class Layout3D {
	public Position3D Position;
	public Rotation3D Rotation;
	public Dimension3D Dimension;
	
	public this () {
		Position=new Position3D;
		Rotation=new Rotation3D;
		Dimension=new Dimension3D;
	}
}