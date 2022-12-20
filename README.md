
Tureba's base configuration files
=================================

In order to use these files, you/I have to:

* place the repo in ~/src/myconfigfiles
* link ~/.config/vim to ~/src/myconfigfiles/config/vim and get the submodules
* edit ~/.{bash,zsh,psql}rc to source ~/src/myconfigfiles/{bash,zsh,psql}rc after system stuff and before the local machine's specific configuration
* link ~/.toprc, ~/.inputrc, ~/.gitconfig, ~/.jq, ~/.ansible.cfg and ~/.tmux.conf to the respective files in ~/src/myconfigfiles
* link ~/.config/i3/config to ~/src/myconfigfiles/i3config
* link ~/.vagrant.d/{Vagrantfile,ansible,templates} to
  ~/src/myconfigfiles/vagrant.d/{Vagrantfile,ansible,templates}
* make sure the default XDG directories are there (the most interesting ones are in ~/src/myconfigfiles/environment)
* resource ~/.{bash,zsh}rc
* ????
* profit

Arthur Nascimento <tureba@gmail.com> (github.com/tureba)
