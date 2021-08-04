export LANG=ja_JP.UTF-8
## IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx5 &

# urxvt
xrdb ~/.Xresources

#Screenshot
flameshot &

#wallpaper
sh ~/.fehbg &

#urxvt daemon
urxvtd --quiet --fork --opendisplay


exec xmonad

