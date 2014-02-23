// D import file generated from 'ZetaBox\Graphics\Core\Layout.d'
module ZetaBox.Graphics.Core.Layout;
class Axis2D
{
	public float x;

	public float y;

}
class Axis3D
{
	public float x;

	public float y;

	public float z;

}
class Position2D : Axis2D
{
	public this();

	public this(float x, float y);

}
class Position3D : Axis3D
{
	public this();

	public this(float x, float y, float z);

}
class Rotation2D : Axis2D
{
}
class Rotation3D : Axis3D
{
}
class Dimension2D : Axis2D
{
}
class Dimension3D : Axis3D
{
}
class Layout
{
}
class Layout2D
{
	public Position2D Position;

	public Rotation2D Rotation;

	public Dimension2D Dimension;

	public this();

}
class Layout3D
{
	public Position3D Position;

	public Rotation3D Rotation;

	public Dimension3D Dimension;

	public this();

}
