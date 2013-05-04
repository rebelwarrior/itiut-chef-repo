#!/bin/sh
desktop_file=emacs24.desktop
if [ ! -e ${desktop_file} ]; then
    sed 's/^\(Exec=\)\([^ ]*\) .*$/\1env LANG=ja_JP.UTF-8 \2 %U/g' /usr/share/applications/${desktop_file} > ${desktop_file}
fi
rm -f $0
