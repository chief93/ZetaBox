module ZetaBox.Common.Collections;

class KeyValuePair (TKey, TValue) {
	public TKey Key;
	public TValue Value;
	
	public this () { }
	public this (TKey key, TValue value) {
		Key=key;
		Value=value;
	}
}

class List (TValue) {
	protected TValue[] _cache;
	protected uint __i;

	public @property int Count () { return _cache.length; }

	// enabling foreach iteration support
	public @property bool empty () { return __i == _cache.length; }
	public @property ref TValue front () { return _cache[__i]; }
	public void popFront () { __i++; }
	
	public this () {
		__i = 0;
	}
	
	public List!TValue Add (TValue item) {
		_cache~=item;
		
		return this;
	}
	
	public TValue Get (int offset) {
		if (offset < 0 ||_cache.length < offset) return null;

		return _cache[offset];
	}
}

class Dictionary (TKey, TValue) {
	protected KeyValuePair!(TKey, TValue)[] _cache;
	
	public this () { }
	
	public Dictionary!(TKey, TValue) Set (TKey key, TValue value) {
		KeyValuePair!(TKey,TValue) item=new KeyValuePair!(TKey,TValue)(key, value);
		_cache~=item;
		
		return this;
	}
	
	public TValue Get (TKey key) {
		foreach (i, item; _cache)
			if (item.Key==key) return item.Value;
		
		return null;
	}
}