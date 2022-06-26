if [ -f /home/gauss/host/display.sh ]; then
	. /home/gauss/host/display.sh
fi

if ! [ -f ~/.ibus.inited ]; then
	dconf write /desktop/ibus/general/hotkey/triggers "['<Control><Shift>']"
	dconf write /desktop/ibus/general/preload-engines "['rime', 'xkb:us::eng']"
	dconf write /desktop/ibus/general/version "'1.5.17'"

	touch ~/.ibus.inited
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

$@
