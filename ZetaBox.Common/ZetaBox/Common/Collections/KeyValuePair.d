module ZetaBox.Common.Collections.KeyValuePair;

class KeyValuePair (TKey, TValue) {
	public TKey Key;
	public TValue Value;

	public this () { }
	public this (TKey key, TValue value) {
		Key=key;
		Value=value;
	}
}