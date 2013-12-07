/* Copyright 2013 Akshay Shekher
*
* This file is part of Session-Indicator
*
* Hello Again is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Hello Again is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Session-Indicator. If not, see http://www.gnu.org/licenses/.
*/

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