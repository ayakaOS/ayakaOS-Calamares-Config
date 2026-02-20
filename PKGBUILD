pkgname=caelumos-calamares-config
pkgver=26.02
pkgrel=1
pkgdesc="CaelumOS 的 Calamares 设置"
arch=('any')
#url="https://github.com/arch-linux-calamares-installer"
url="https://github.com/CaelumOS/CaelumOS-Calamares-Config"
license=('GPL-3.0-or-later')
makedepends=('git')
provides=()
install="${pkgname}.install"
conflicts=('alci-calamares-config'
           'alci-calamares-config-dev'
           'alci-calamares-config-pure'
           'alci-calamares-config-btrfs')

source=("$pkgname::git+file://$PWD")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"
    
    # 安装calamares配置文件
    install -d "$pkgdir/etc/calamares"
    install -d "$pkgdir/usr/share/calamares"
    
    # 复制配置文件（根据实际文件结构调整）
    if [ -d "etc" ]; then
        cp -r etc/* "$pkgdir/etc/"
    fi
    
    if [ -d "usr" ]; then
        cp -r usr/* "$pkgdir/usr/"
    fi
}
