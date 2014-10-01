rm -rf .git
git init
rm -rf craft
git submodule add -b master https://github.com/pixelandtonic/Craft-Release.git craft
git remote rm origin
git add -A
git commit -m "Inital commit"