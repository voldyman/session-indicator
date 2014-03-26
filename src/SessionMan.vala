namespace SesIndicator {

	[DBus (name = "org.gnome.SessionManager")]
	interface ISessionManager : Object {
		public abstract bool CanShutdown () throws IOError;
		public abstract void Logout (uint32 mode = 0) throws IOError;
		public abstract void Shutdown () throws IOError;
		public abstract void Reboot () throws IOError;
		public abstract void RequestShutdown () throws IOError;
		public abstract void RequestReboot () throws IOError;
		public abstract bool IsSessionRunning () throws IOError;
	}

	public class SessionManager {
		private ISessionManager sm;
		public SessionManager () {
			try {
				sm = Bus.get_proxy_sync (BusType.SESSION,
										 "org.gnome.SessionManager",
										 "/org/gnome/SessionManager");
			} catch (IOError e) {
				error ("%s\n", e.message);
			}
		}

		public void shutdown () {
			try {
				sm.Shutdown ();
			} catch (IOError e) {
				warning ("%s", e.message);
			}
		}
		public void logout () {
			try {
				sm.Logout ();
			} catch (IOError e) {
				warning ("%s", e.message);
			}
		}
		public void reboot () {
			try {
				sm.Reboot ();
			} catch (IOError e) {
				warning ("%s", e.message);
			}
		}
		public bool is_session_running () {
			try {
				return sm.IsSessionRunning ();
			} catch (IOError e) {
				warning ("%s", e.message);
				return false;
			}
		}
		public bool can_shutdown () {
			try {
				return sm.CanShutdown ();
			} catch (IOError e) {
				warning ("%s", e.message);
				return false;
			}
		}
	}
}