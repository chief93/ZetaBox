// D import file generated from 'D:\dev\projects\d\ZetaBox\ZetaBox.Graphics\ZetaBox\Graphics\Window.d'
module ZetaBox.Graphics.Window;
import ZetaBox.Common.Events;
import ZetaBox.Graphics.GL;
class RenderingEvent
{
	public @property string Name();


}
class Window : IEventable
{
	private EventRack _events;

	public template On(TEvent)
	{
		void On(void delegate(TEvent) e)
		{
			_events.On!(TEvent)(e);
		}

	}

	public template Off(TEvent)
	{
		void Off(void delegate(TEvent) e)
		{
			_events.Off!(TEvent)(e);
		}

	}

	public this(string title = "");

	public void Render();

}
