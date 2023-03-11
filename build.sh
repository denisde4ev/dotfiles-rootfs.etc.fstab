#!/bin/sh

# similar to: https://github.com/denisde4ev/dotfiles-pc57-win/blob/master/Windows/System32/drivers/etc/hosts.src.d/build.sh

set -eu
cd "${0%/*}" || exit

export fstab_old="$PWD"/out/fstab # used to keep old config
./src/fstab.preprocess > ./out/fstab.outing || exit
mv -f ./out/fstab.outing ./out/fstab || exit

if YN_confirm -S y 'deploy to system fstab'; then
	cat ./out/fstab  > "${PREFIX-}/etc/fstab"
fi
