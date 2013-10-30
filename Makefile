all:
	valac --pkg gtk+-3.0 --pkg appindicator3-0.1 src/Main.vala src/Indicator.vala src/SessionMan.vala src/ConformationDialog.vala -o session-indicator
