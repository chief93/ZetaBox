// D import file generated from 'D:\dev\projects\d\ZetaBox\ZetaBox.Common\ZetaBox\Common\Events.d'
module ZetaBox.Common.Events;
import std.traits;
import ZetaBox.Common.Collections;
interface IEventContainer
{
	@property string Name();

}
interface IEventable
{
	template On(TEvent)
	{
		void On(void delegate(TEvent) e);

	}
	template Off(TEvent)
	{
		void Off(void delegate(TEvent) e);

	}
}
class EventRack
{
	private List!(IEventContainer) _events;

	public this();

	public template Add(TEvent)
	{
		void Add()
		{
			_events.Add(cast(IEventContainer)new Event!(TEvent));
		}

	}

	private template _findEvent(TEvent)
	{
		void _findEvent(void delegate(Event!(TEvent)) callback)
		{
			string name = typeid(TEvent).toString();
			foreach (IEventContainer event; _events)
			{
				try
				{
					Event!(TEvent) target = cast(Event!(TEvent))event;
					callback(target);
					break;
				}
				catch(Exception e)
				{
				}
			}
		}

	}

	public template Dispatch(TEvent)
	{
		void Dispatch(TEvent event)
		{
			_findEvent!(TEvent)(delegate (Event!(TEvent) e)
			{
				e.Dispatch(event);
			}
			);
		}

	}

	public template On(TEvent)
	{
		void On(void delegate(TEvent) callback)
		{
			_findEvent!(TEvent)(delegate (Event!(TEvent) e)
			{
				e.On(callback);
			}
			);
		}

	}

	public template Off(TEvent)
	{
		void Off(void delegate(TEvent) callback)
		{
			_findEvent!(TEvent)(delegate (Event!(TEvent) e)
			{
				e.Off(callback);
			}
			);
		}

	}

}
template Event(TEvent)
{
	class Event : IEventContainer
	{
		private List!(void delegate(TEvent)) _listeners;

		public @property string Name()
		{
			return typeid(TEvent).toString();
		}



		public this()
		{
			_listeners = new List!(void delegate(TEvent));
		}


		public void Dispatch(TEvent event)
		{
			foreach (void delegate(TEvent) listener; _listeners)
			{
				listener(event);
			}
		}


		public void On(void delegate(TEvent) callback)
		{
			_listeners.Add(callback);
		}


		public void Off(void delegate(TEvent) callback)
		{
		}


	}
}
