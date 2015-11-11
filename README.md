
checkout this with "git clone --recursive"


place a bootable bootx64.efi in prebuilt/, you can find one here: http://forum.xda-developers.com/thinkpad-tablet/general/yoga-tab-2-unlocking-daaa-deee-daaa-dooo-t3241260


prebuilt		- prebuilt binaries
kconfig			- kernel configs
external		- external projects
custom			- customisations added to initramfs

To check that stuff works:
	bash run_installer.sh lttcmd=diagnostics
This will only execute diagnostics and not make any changes to your android installation.


Currently supported devices:
	Lenovo Yoga Android tablets


