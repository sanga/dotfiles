#!/bin/sh

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo aptitude update
sudo aptitude install dtrx elinks joe mosh strace tmux tshark wget zsh source-highlight xterm
sudo aptitude install -t squeeze-backports python-pip git # squeeze pip has a nasty bug - it can't uninstall packages
sudo pip install --upgrade distribute
sudo pip install flake8 grequests ipython jsonpath matplotlib ordereddict pandas pep8 pyflakes sh virtualenv pudb
echo these require manual install: sublimetext
rm -r ./build  # remove pip build dir
