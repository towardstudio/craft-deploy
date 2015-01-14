# Craft Deploy by Bluegg

A framework for deploying Craft websites with Capistrano 3. 

## Features

- Deploy Craft website from your choice of Git server (eg Bitbucket or Github) using Capistrano
- Push and pull databases between environments
- Sync asset folder between environments
- Simple boilerplate for Craft, inspired by https://github.com/imjakechapman/CraftCMS-Boilerplate
- Installs latest version of Craft

- - -

## Requirements

- wget installed on local machine.
- command-line access to 'mysqldump' on your local machine.
- a server with appropriate packages installed, with ssh access.

- - -

## Installation

First thing is to clone this repo to your local machine:

```sh
cd my/desired/directory
git clone https://github.com/Bluegg/craft-deploy
```

### 1. Run install script

Craft Deploy contains a bash script that does the initial setup:

- downloads latest release of Craft from Pixel & Tonic.
- creates the directory structure required.
- sets up config for local, staging and production environments (you can change these).
- sets up basic folders for Craft website.
- sets up folders for database backups.

Run this (on OS X or Linux) with:

```sh
bash install.sh
```

Feel free to remove this file afterwards, as its no longer required. 

**Windows users, I have no idea how to do this, you're on your own!**

### 2. Install Craft 

From there, you can go ahead and install Craft locally. This framework contains a basic setup for managing different Craft environments, by default it assumes 'local', 'staging' and 'live' environments. To configure your local Craft environment, you will find the config in /craft/config/local/db.php. Here, you enter your 'local' database connection strings.

```php
return array(
	// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
	'server' => 'localhost',
	// The database username to connect with.
	'user' => 'root',
	// The database password to connect with.
	'password' => '',
	// The name of the database to select.
	'database' => '',
	// The prefix to use when naming tables. This can be no more than 5 characters.
	'tablePrefix' => 'craft',
);
```

The local config files are .gitignore'd and so will not be deployed or contained in your repo. Please note, if you remove this from .gitignore, they will be deployed and subsequently cause problems as Craft will look at these for database connection strings.

You will also need to enter the same connection strings in the Capistrano config, found in /cap/deploy.rb:

```ruby
set :local_db_host, "[db_host]"
set :local_db_name, "[db_name]"
set :local_db_user, "[db_user]"
set :local_db_password, "[db_password]"
```

### 3. Set up Git

Your Craft website must be in a Git repo somewhere that is accessible from your web server (via ssh) and your local machine. We use private repos on Bitbucket, with access provided via ssh. Make sure your Git repo is referenced in /cap/deploy.rb along with ssh credentials.

### 4. Configure your server

For Craft Deploy to work, you must have 'passwordless login' ssh access to your webserver. You also need to make sure Git and mysql works on the server, along with any requirements of Craft itself. You will need to create the database on your server, with relevant connection strings entered in both the Craft and Capistrano config files. Adding a task to create remote databases as part of the installation phase is on our roadmap.

### 5. Deploy

If everything is set up correctly, you can do your first deployment. To deploy to your production environment:

```sh
cap production deploy
```

Hopefully, everything should go smoothly and Capistrano will do its thing. Problems here are usually related to ssh access to the web server or your Git repo.

## Tasks

Alongside Capistranos [various tasks](http://capistranorb.com/), Craft Deploy adds some useful commands for working with Craft websites.

### Databases

Craft deploy can push and pull databases (via mysqldump) between environments:

```sh
cap production db:push
```

or

```sh
cap production db:pull
```

### Assets

Craft Deploy uses rsync to synchronise assets between enviroments:

```sh
cap production craft:sync_assets
```

For convenience, you can push or pull both databases and sync assets with a single command:

```sh
cap production craft:push
```

```sh
cap production craft:pull
```
