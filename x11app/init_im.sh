if ! [ -f ~/.ibus.inited ]; then
	dconf write /desktop/ibus/general/hotkey/triggers "['<Control><Shift>']"
	dconf write /desktop/ibus/general/preload-engines "['pinyin', 'xkb:us::eng']"
	dconf write /desktop/ibus/general/version "'1.5.17'"

	touch ~/.ibus.inited
fi
