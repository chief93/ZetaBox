// D import file generated from 'ZetaBox\Common\Collections\KeyValuePair.d'
module ZetaBox.Common.Collections.KeyValuePair;
template KeyValuePair(TKey, TValue)
{
	class KeyValuePair
	{
		public TKey Key;

		public TValue Value;

		public this()
		{
		}


		public this(TKey key, TValue value)
		{
			Key = key;
			Value = value;
		}


	}
}
