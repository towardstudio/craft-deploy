wget http://buildwithcraft.com/latest.zip?accept_license=yes
mv latest.zip?accept_license=yes latest.zip
unzip latest.zip
rm latest.zip
mv public public_html
mv craft/templates templates
mv craft/plugins plugins

mkdir craft/config/local
cp craft/config/db.php craft/config/local/db.php
cp craft/config/general.php craft/config/local/general.php

rm craft/config/db.php
rm craft/config/general.php
rm .gitignore

cp craft-templates/db.php craft/config/db.php
cp craft-templates/general.php craft/config/general.php
cp craft-templates/gitignore.txt .gitignore

rm craft-templates