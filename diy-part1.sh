#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default



# 添加SSR-Plus
rm -rf package/luci-app-ssr-plus
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus




# 添加PassWall
rm -rf package/passwall
rm -rf package/luci-app-passwall
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone  https://github.com/xiaorouji/openwrt-passwall.git package/passwall
mv -f package/passwall package/luci-app-passwall

# Add luci-app-openclash
git clone -b master https://github.com/vernesong/OpenClash.git package-temp
rm -rf package/lean/luci-app-openclash
mv -f package-temp/luci-app-openclash package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_LIBCURL_COOKIES=y
CONFIG_LIBCURL_FILE=y
CONFIG_LIBCURL_FTP=y
CONFIG_LIBCURL_HTTP=y
CONFIG_LIBCURL_NO_SMB="!"
CONFIG_LIBCURL_OPENSSL=y
CONFIG_LIBCURL_PROXY=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_libcurl=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_terminfo=y
EOF
