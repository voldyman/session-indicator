namespace SesIndicator {
	public class Application : Gtk.Application {
		public SessionManager sm;
		public ScreenSaver ss;
		public Indicator app_indicator;
			
		public Application () {
			Object (application_id: "com.voldy.sesindicator",
					flags: ApplicationFlags.FLAGS_NONE);
			
			ss = new ScreenSaver ();
			sm = new SessionManager ();
		}

		protected override void startup () {
			base.startup ();
			
			app_indicator = new Indicator (this, "Session Indicator");
			new MainLoop ().run ();
		}

		protected override void activate () { }
		
	}
    int main (string[] args) {
		Application app = new Application ();
		
        return app.run (args);
    }
}