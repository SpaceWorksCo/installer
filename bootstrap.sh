#!/bin/bash
cat << "EOF"
        _..._
      .'     '.      _         / _____|_____ (_______|_______|_______)
     /    .-""-\   _/ \       ( (____  _____) )______ _       _____
   .-|   /:.   |  |   |        \____ \|  ____/  ___  | |     |  ___)
   |  \  |:.   /.-'-./         _____) ) |    | |   | | |_____| |_____
   | .-'-;:__.'    =/         (______/|_|    |_|   |_|\______)_______)
   .'=  *=|SPACE_.='                                Bootstrap Installer Program
  /   _.  |    ;
 ;-.-'|    \   |
/   | \    _\  _\
\__/'._;.  ==' ==\
         \    \   |
         /    /   /
         /-._/-._/
         \   `\  \
          `-._/._/
EOF

# move to home directory
cd ~
echo ""

# download boostrap
echo "Downloading bootstrap from dexstats.info."
echo ""
wget https://eu.bootstrap.dexstats.info/SPACE-bootstrap.tar.gz

# extract folder
echo "Extracting SPACE-bootstrap.tar.gz."
echo ""
tar xzvf SPACE-bootstrap.tar.gz

# move blocks and chainstate folders to data directory
echo ""
echo "Copying blocks and chainstate folders to the data directory."
echo ""
cp -a blocks .komodo/SPACE/
cp -a chainstate .komodo/SPACE/

# delete downloaded files
rm -rf blocks chainstate SPACE-bootstrap.tar.gz

echo "Spacecoin bootstap complete!"
echo ""
