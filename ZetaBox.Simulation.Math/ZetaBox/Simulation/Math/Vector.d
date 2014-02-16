module ZetaBox.Simulation.Math.Vector;

import std.math;

import ZetaBox.Simulation.Math.Point;

class Vector
{
	public Point a;
	public Point b;

	this(Point a, Point b) {
		this.a = a;
		this.b = b;
	}

	float GetLength() {
		return sqrt(pow((this.b.x - this.a.x),2) + pow((this.b.y - this.a.y),2) + pow((this.b.z - this.a.z),2));
	}
}

