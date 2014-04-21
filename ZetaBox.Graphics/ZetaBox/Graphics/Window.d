module ZetaBox.Graphics.Window;

import ZetaBox.Common.Events;
import ZetaBox.Graphics.GL;

class RenderingEvent {
	public @property string Name () { return "RenderReady"; }
}

class Window : IEventable {
	private EventRack _events;
	
	public void On (TEvent)(void delegate(TEvent) e) { _events.On!TEvent(e); }
	public void Off (TEvent)(void delegate(TEvent) e) { _events.Off!TEvent(e); }
	
	public this (string title = "") {
		_events = new EventRack();
		
		_events.Add!RenderingEvent();
	}
	
	public void Render () {
		_events.Dispatch!RenderingEvent(new RenderingEvent());
	}
}