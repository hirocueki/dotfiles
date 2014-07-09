#! /bin/bash

# シンボリックリンクを張るようなシェルスクリプトを書く
# .gitが入らないようしたいのでgrep -v 'dotfiles/.git$'
for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
	    ln -s $HOME/dotfiles/$file $HOME/$file
done
