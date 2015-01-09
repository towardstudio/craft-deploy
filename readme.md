# craft-deploy

A framework for deploying Craft websites with Capistrano 3. 

## Features

- Deploy Craft website from your choice of Git server (eg Bitbucket or Github) using Capistrano
- Push and pull databases between environments
- Sync asset folder between environments
- Simple boilerplate for Craft, inspired by https://github.com/imjakechapman/CraftCMS-Boilerplate
- Installs latest version of Craft

## Requirements

- wget installed on local machine


## Installation

run `bash install.sh` which:

- downloads latest release of Craft from Pixel & Tonic.
- creates the directory structure required
- sets up config for local, staging and production environments (you can change these)
- sets up basic folders for Craft website
- sets up folders for database backups

### Keep in Mind
If you're using MAMP, you'll have issues when trying to run MySQL commands as the PHP version in MAMP is different to the one in your $PATH. You can fix this by adding the following two lines to your `.bash_profile` (or `.zshrc`):

```sh
export MAMP_PHP=/Applications/MAMP/bin/php/php5.4.4/bin
export PATH="$MAMP_PHP:$PATH"
```

Be sure you check the PHP version is correct and amend the path appropriately for your MAMP PHP version. see [this question on Stack Overflow](http://stackoverflow.com/questions/4145667/how-to-override-the-path-of-php-to-use-the-mamp-path/) for more info.

