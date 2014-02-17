module ZetaBox.Simulation.Math.PositionVector;

import std.math;

import ZetaBox.Simulation.Math.Point;

class PositionVector {
	public Point a;
	
	public this (Point a) {
		this.a=a;
	}
	
	public float GetLength () {
		return sqrt(
			pow((this.a.x), 2)+
			pow((this.a.y), 2)+
			pow((this.a.z), 2)
			);
	}
}