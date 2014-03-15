module ZetaBox.Graphics.Layout;

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
	public this () {
		x = 0;
		y = 0;
	}
	
	public this (float x, float y) {
		this.x = x;
		this.y = y;
	}
}

class Rotation3D : Axis3D {
}

class Dimension2D : Axis2D {
	public this () {
		x = 0;
		y = 0;
	}
	
	public this (float x, float y) {
		this.x = x;
		this.y = y;
	}
}

class Dimension3D : Axis3D {
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

	public this (Position2D position) {
		Position=position;
		Rotation=new Rotation2D;
		Dimension=new Dimension2D;
	}
	
	public this (Rotation2D rotation) {
		Position=new Position2D;
		Rotation=rotation;
		Dimension=new Dimension2D;
	}
	
	public this (Dimension2D dimension) {
		Position=new Position2D;
		Rotation=new Rotation2D;
		Dimension=dimension;
	}
	
	public this (Position2D position, Rotation2D rotation) {
		Position=position;
		Rotation=rotation;
		Dimension=new Dimension2D;
	}
	
	public this (Position2D position, Rotation2D rotation, Dimension2D dimension) {
		Position=position;
		Rotation=rotation;
		Dimension=dimension;
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
	
	public this (Position3D position) {
		Position=position;
		Rotation=new Rotation3D;
		Dimension=new Dimension3D;
	}
	
	public this (Rotation3D rotation) {
		Position=new Position3D;
		Rotation=rotation;
		Dimension=new Dimension3D;
	}
	
	public this (Dimension3D dimension) {
		Position=new Position3D;
		Rotation=new Rotation3D;
		Dimension=dimension;
	}
	
	public this (Position3D position, Rotation3D rotation) {
		Position=position;
		Rotation=rotation;
		Dimension=new Dimension3D;
	}
	
	public this (Position3D position, Rotation3D rotation, Dimension3D dimension) {
		Position=position;
		Rotation=rotation;
		Dimension=dimension;
	}
}