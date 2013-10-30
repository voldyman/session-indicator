using Gtk;
namespace SesIndicator {
    public class ConformationDialog : Gtk.MessageDialog {

        public ConformationDialog.for_shutdown () {
			this.title = "Shutdown";
			
            use_markup = true;
            set_markup ("<b>" + "Are you sure you want to close all programs and shutdown the computer ?" + "</b>");

            var ok_btn = new Gtk.Button.with_label ("Shutdown");
			ok_btn.show ();
            add_action_widget (ok_btn, 0);

            var cancel_btn = new Gtk.Button.with_label ("Cancel");
			cancel_btn.show ();
            add_action_widget (cancel_btn, 1);

            var img = new Image.from_icon_name ("system-shutdown",
                                                Gtk.IconSize.DIALOG);
			img.show ();

            set_image (img);
        }
        public ConformationDialog.for_reboot () {
			this.title = "Reboot";
			
            use_markup = true;
            set_markup ("<b>" + "Are you sure you want to close all programs and reboot the computer ?" + "</b>");

            var ok_btn = new Gtk.Button.with_label ("Reboot");
			ok_btn.show ();
            add_action_widget (ok_btn, 0);

            var cancel_btn = new Gtk.Button.with_label ("Cancel");
			cancel_btn.show ();
            add_action_widget (cancel_btn, 1);

            var img = new Image.from_icon_name ("system-reboot",
                                                Gtk.IconSize.DIALOG);
			img.show ();

            set_image (img);
        }

        public ConformationDialog.for_logout () {
			this.title = "Logout";
			
            use_markup = true;
            set_markup ("<b>" + "Are you sure you want to close all programs and logout ?" + "</b>");

            var ok_btn = new Gtk.Button.with_label ("Logout");
			ok_btn.show ();
            add_action_widget (ok_btn, 0);

            var cancel_btn = new Gtk.Button.with_label ("Cancel");
			cancel_btn.show ();
            add_action_widget (cancel_btn, 1);

            var img = new Image.from_icon_name ("system-log-out",
                                                Gtk.IconSize.DIALOG);
			img.show ();

            set_image (img);
        }

    }
}