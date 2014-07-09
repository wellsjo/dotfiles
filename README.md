###Setup script:
<pre>
git clone git@github.com:wellsjo/wells_dotfiles.git && mv wells_dotfiles .wells_dotfiles && source .wells_dotfiles/bash/profile && wells_install
</pre>

It clones this repository and then sets symlinks to the bash, vim, and git dotfiles.  Type 'whelp' to get a list of functions and commands available.  Enjoy

####Bash aliases & functions
<pre>
whelp      # get a list of available commands
wssh       # ssh into a remote server and installs my dotfile setup from this repository
winstall   # this is used by wssh to install my dotfiles upon entering a remote machine.
           # alternatively, you can just clone this repository, source the profile located 
           # in wells_dotfiles/bash/profile, then run winstall.  This is explained above.

wupdate    # updates dotfile settings from this repo.  optionally just updates locally.
wpush      # updates the remote repo.  you can fork this and go nuts, if you'd like.

ta         # tmux -2 attach
t          # tmux -2
..         # cd ..
ll         # ls -la

fe         # fuzzy find & open file in vim
fd         # fuzzy find & go to directory
fh         # fuzzy search repeat history
fkill      # fuzzy search & kill process(es)
</pre>

####Vim plugins, settings, and shortcuts
<pre>
# visual mode
S(char)         # surround with (char)
gc              # toggle comment

# fzf
cntrl-t         # fuzzy file search
cntrl-h         # toggle highlight

# fugitive.vim
:Gblame         # git blame
:Git (command)  # any git command
</pre>
