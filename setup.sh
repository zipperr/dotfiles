DOT_FILES=(.vim .vimrc .zshrc .irssi screenfetch-dev)
for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
