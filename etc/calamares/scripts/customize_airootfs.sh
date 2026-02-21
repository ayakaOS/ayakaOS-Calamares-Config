#!/usr/bin/env bash

## Script to perform several important tasks before `mkarchcraftiso` create filesystem image.

set -e -u

## /etc/issue
rm /usr/share/pixmaps/archlinux-logo.png
ln -s /usr/share/pixmaps/logo.png /usr/share/pixmaps/archlinux-logo.png

rm /usr/share/pixmaps/archlinux-logo.svg
ln -s /usr/share/pixmaps/logo.svg /usr/share/pixmaps/archlinux-logo.svg

rm /usr/share/pixmaps/archlinux-logo-text.svg
ln -s /usr/share/pixmaps/logo-text.svg /usr/share/pixmaps/archlinux-logo-text.svg

rm /usr/share/pixmaps/archlinux-logo-text-dark.svg
ln -s /usr/share/pixmaps/logo-text-dark.svg /usr/share/pixmaps/archlinux-logo-text-dark.svg

## -------------------------------------------------------------- ##

## -------------------------------------------------------------- ##

## /etc/motd
#cat > "/etc/motd" <<- _EOF_
#_EOF_
echo 'CaelumOS | Do simple things.' > /etc/motd
echo '' >> /etc/motd
echo ' Welcome to CaelumOS!' >> /etc/motd
echo '' >> /etc/motd
#echo ' - URL:    https://ayakaOS.asia' >> /etc/motd
#echo ' - Docs:   https://ayakaOS.de5.net' >> /etc/motd
echo ' - GitHub: https://github.com/CaelumOS/CaelumOS' >> /etc/motd
echo '' >> /etc/motd

## -------------------------------------------------------------- ##

## -------------------------------------------------------------- ##

## 更换国内源
echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.cernet.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.shanghaitech.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

## archlinuxcn
echo '' >> /etc/pacman.conf
echo '[archlinuxcn]' >> /etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.cernet.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.bfsu.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.aliyun.com/archlinuxcn/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.shanghaitech.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

## arch4edu
echo '' >> /etc/pacman.conf
echo '[arch4edu]' >> /etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/arch4edu/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/arch4edu/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.cernet.edu.cn/arch4edu/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.bfsu.edu.cn/arch4edu/$arch' >> /etc/pacman.conf
echo 'Server = https://mirrors.aliyun.com/arch4edu/$arch' >> /etc/pacman.conf
pacman-key --recv-keys 7931B6D628C8D3BA
pacman-key --finger 7931B6D628C8D3BA
pacman-key --lsign-key 7931B6D628C8D3BA

## CaelumOS
echo '' >> /etc/pacman.conf
echo '[CaelumOS]' >> /etc/pacman.conf
echo 'SigLevel = Never' >> /etc/pacman.conf
echo 'Server = https://raw.githubusercontent.com/CaelumOS/CaelumOS-repo/main' >> /etc/pacman.conf
#echo 'Server = file:///var/ayakaOS-repo' >> /etc/pacman.conf # 本地源

##fcitx5
echo "GTK_IM_MODULE=fcitx5" >> /etc/environment
echo "QT_IM_MODULE=fcitx5" >> /etc/environment
echo "XMODIFIERS=@im=fcitx5" >> /etc/environment
echo "SDL_IM_MODULE=fcitx5" >> /etc/environment
