module ZetaBox.Graphics.Core.Color;

class Color {
	public float Red;
	public float Green;
	public float Blue;
	public float Alpha;

	public this () {
		Red=0.0;
		Green=0.0;
		Blue=0.0;
		Alpha=1.0;
	}

	public this (float red, float green, float blue) {
		Red=red;
		Green=green;
		Blue=blue;
		Alpha=1.0;
	}
	
	public this (float red, float green, float blue, float alpha) {
		Red=red;
		Green=green;
		Blue=blue;
		Alpha=alpha;
	}
}