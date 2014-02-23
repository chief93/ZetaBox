// D import file generated from 'ZetaBox\Common\Collections\List.d'
module ZetaBox.Common.Collections.List;
template List(TValue)
{
	class List
	{
		private TValue[] _cache;

		public this()
		{
		}


		public List!(TValue) Add(TValue item)
		{
			_cache ~= item;
			return this;
		}


		public TValue Get(int offset)
		{
			TValue item = null;
			try
			{
				item = _cache[offset];
			}
			catch(Exception e)
			{
			}
			return item;
		}


	}
}
