using AppIndicator;

namespace SesIndicator {
	
    public class Indicator {
        private const string ICON_NAME = "system-shutdown";

		private Application app;
		
        private AppIndicator.Indicator ind;
        private Gtk.Menu ind_menu;

        private Gtk.MenuItem logout;
        private Gtk.MenuItem reboot;
        private Gtk.MenuItem shutdown;

        public delegate void EntryActivateFunc ();

        public Indicator (Application app, string title) {
			this.app = app;
			
            ind = new AppIndicator.Indicator (title, ICON_NAME,
                                              IndicatorCategory.APPLICATION_STATUS);

            ind.set_status (IndicatorStatus.ACTIVE);

            setup_menu ();
			connect_signals ();
        }

        private void setup_menu () {
            ind_menu = new Gtk.Menu ();

            logout = new Gtk.MenuItem.with_label ("Logout");
            reboot = new Gtk.MenuItem.with_label ("Reboot");
            shutdown = new Gtk.MenuItem.with_label ("Shutdown");

            ind_menu.append (logout);
            ind_menu.append (reboot);
            ind_menu.append (shutdown);

			ind_menu.show_all ();

            ind.set_menu (ind_menu);
        }

		private void connect_signals () {
			logout.activate.connect ( () => {
				app.sm.logout ();
			});
			shutdown.activate.connect ( () => {
				app.sm.shutdown ();
			});
			reboot.activate.connect ( () => {
				app.sm.reboot ();
			});
		}
/*		private void connect_signals () {
			logout.activate.connect ( () => {
					var d = new ConformationDialog.for_logout ();
					if (d.run () == 0) {
						app.sm.logout ();
					} 
					d.destroy ();
				});
			shutdown.activate.connect ( () => {
					var d = new ConformationDialog.for_shutdown ();
					if (d.run () == 0) {
						app.sm.shutdown ();
					} 
					d.destroy ();
				});
			reboot.activate.connect ( () => {
					var d = new ConformationDialog.for_reboot ();
					if (d.run () == 0) {
						app.sm.reboot ();
					} 
					d.destroy ();
				});
		}
*/
		
    }
}
