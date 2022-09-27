if ! [ -a build ] ; then
    mkdir build
fi
# Add path to ~/.zshrc or ~/.bashrc
# the path in archlinux family is different from openSUSE.
zsh_route=/usr/bin/zsh
bash_route=/usr/bin/bash
if [ $SHELL == $bash_route ]
then then echo "export KDE_INSTALL_QMLDIR="/usr/lib/qml:$KDE_INSTALL_QMLDIR"" >> ~/.bashrc
elif [ $SHELL == $zsh_route ]
then echo "export KDE_INSTALL_QMLDIR="/usr/lib/qml:$KDE_INSTALL_QMLDIR"" >> ~/.zshrc
fi

cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  .. -Wnodev
make -j$(nproc)
sudo make install
