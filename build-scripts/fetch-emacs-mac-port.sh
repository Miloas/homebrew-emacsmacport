#!/bin/sh

set -e

echo "fetch tarball"
git clone --depth=1 --branch=master https://github.com/Miloas/emacs-mac.git emacs-source

echo "apply patch: --with-natural-title-bar"
patch -d emacs-source -p1 < ../patches/emacs-mac-title-bar-9.0.patch

echo "apply patch: multi-tty-27"
patch -d emacs-source -p1 < ../patches/multi-tty-27.diff

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d emacs-source -p1 < ../patches/bundle-signature-hack-9.0.diff
