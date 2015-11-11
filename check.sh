

if [[ ! -f external/bootx64.efi ]]; then
	echo "external/bootx64.efi does not exist, please get it from http://forum.xda-developers.com/thinkpad-tablet/general"
	exit 1
fi

if [[ ! -f external/mkbootimg.git/mkbootimg ]]; then
	echo "mkbootimg tool does not exist, did you clone the repository with --recursive?"
	exit 1
fi
