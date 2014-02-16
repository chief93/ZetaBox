// D import file generated from 'ZetaBox\Common\Collections\Dictionary.d'
module ZetaBox.Common.Collections.Dictionary;
import ZetaBox.Common.Collections.KeyValuePair;
template Dictionary(TKey, TValue)
{
	class Dictionary
	{
		private KeyValuePair!(TKey, TValue)[] _cache;

		public this()
		{
		}


		public void Set(TKey key, TValue value)
		{
			KeyValuePair!(TKey, TValue) item = new KeyValuePair!(TKey, TValue)(key, value);
			_cache ~= item;
		}


		public TValue Get(TKey key)
		{
			foreach (i, item; _cache)
			{
				if (item.Key == key)
					return item.Value;
			}
			return null;
		}


	}
}
