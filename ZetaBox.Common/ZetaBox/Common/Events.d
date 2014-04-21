module ZetaBox.Common.Events;

import std.traits;
import ZetaBox.Common.Collections;

interface IEventContainer {
	@property string Name();
}

interface IEventable {
	void On (TEvent)(void delegate(TEvent) e);
	void Off (TEvent)(void delegate(TEvent) e);
}


class EventRack {
	private List!IEventContainer _events;
	
	public this () {
		_events = new List!IEventContainer();
	}
	
	public void Add (TEvent)() {
		_events.Add(cast(IEventContainer)new Event!TEvent);
	}
	
	private void _findEvent (TEvent)(void delegate (Event!TEvent) callback) {
		string name = typeid(TEvent).toString();
		
		foreach (IEventContainer event; _events) {
			try {
				Event!TEvent target = cast(Event!TEvent)event;
				callback(target);
				break;
			}
			catch (Exception e) {}
		}
	}
	
	public void Dispatch (TEvent)(TEvent event) {
		_findEvent!TEvent(delegate (Event!TEvent e) {
			e.Dispatch(event);
		});
	}
	
	public void On (TEvent)(void delegate(TEvent) callback) {
		_findEvent!TEvent(delegate (Event!TEvent e) {
			e.On(callback);
		});
	}
	
	public void Off (TEvent)(void delegate(TEvent) callback) {
		_findEvent!TEvent(delegate (Event!TEvent e) {
			e.Off(callback);
		});
	}
}

class Event (TEvent) : IEventContainer {
	private List!(void delegate(TEvent)) _listeners;
	
	public @property string Name () { return typeid(TEvent).toString(); }
	
	public this () {
		_listeners = new List!(void delegate(TEvent));
	}
	
	public void Dispatch (TEvent event) {
		foreach (void delegate(TEvent) listener; _listeners) listener(event);
	}
	
	public void On (void delegate(TEvent) callback) {
		_listeners.Add(callback);
	}
	
	public void Off (void delegate(TEvent) callback) {
		//TODO: removing callback from callback list
	}
}