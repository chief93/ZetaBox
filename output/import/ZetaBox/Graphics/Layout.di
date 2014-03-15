// D import file generated from 'ZetaBox\Graphics\Layout.d'
module ZetaBox.Graphics.Layout;
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
	public this();

	public this(float x, float y);

}
class Rotation3D : Axis3D
{
}
class Dimension2D : Axis2D
{
	public this();

	public this(float x, float y);

}
class Dimension3D : Axis3D
{
	public this();

	public this(float x, float y, float z);

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

	public this(Position2D position);

	public this(Rotation2D rotation);

	public this(Dimension2D dimension);

	public this(Position2D position, Rotation2D rotation);

	public this(Position2D position, Rotation2D rotation, Dimension2D dimension);

}
class Layout3D
{
	public Position3D Position;

	public Rotation3D Rotation;

	public Dimension3D Dimension;

	public this();

	public this(Position3D position);

	public this(Rotation3D rotation);

	public this(Dimension3D dimension);

	public this(Position3D position, Rotation3D rotation);

	public this(Position3D position, Rotation3D rotation, Dimension3D dimension);

}
