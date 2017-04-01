DOT_FILES=(.vimrc .zshrc …)

 for file in ${DOT_FILES[@]}
  do
		       ln -s $HOME/dotfiles/$file $HOME/$file
			    done
