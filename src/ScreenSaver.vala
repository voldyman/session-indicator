namespace SesIndicator {

    [DBus (name = "org.gnome.ScreenSaver")]
    interface IScreenSaver : Object {
        public abstract void Lock () throws IOError;
    }

    public class ScreenSaver {
        private IScreenSaver ss;
        public ScreenSaver () {
            try {
                ss = Bus.get_proxy_sync (BusType.SESSION,
                                         "org.gnome.ScreenSaver",
                                         "/org/gnome/ScreenSaver");
            } catch (IOError e) {
                error ("%s\n", e.message);
            }
        }

        public void lock () {
            try {
                ss.Lock ();
            } catch (IOError e) {
                warning ("%s", e.message);
            }
        }
    }
}