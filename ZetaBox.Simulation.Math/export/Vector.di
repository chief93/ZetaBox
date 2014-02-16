// D import file generated from 'ZetaBox\Simulation\Math\Vector.d'
module ZetaBox.Simulation.Math.Vector;
import std.math;
import ZetaBox.Simulation.Math.Point;
class Vector
{
	public Point a;

	public Point b;

	this(Point a, Point b);
	float GetLength();
}
