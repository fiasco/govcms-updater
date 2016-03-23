# govCMS Updater
A building script for managing govCMS for downstream projects.
## Installation
Run this as apart of your govCMS site project. You can either download a release from github or clone it directly into your existing working project.

```
wget https://github.com/fiasco/govCMS-downstream-builder/archive/master.zip
unzip -d <working_dir> -j master.zip
```
Once download and extracted, you'll need to install the [composer](https://getcomposer.org/) dependancies.

```
composer install
```
**Note:** if you maintain a composer.json file you'll need to merge these together a run `composer update` instead.

## Creating a new Project or Updating an existing project
To create a new govCMS project or to update an existing one, run this command:

```
./vendor/bin/phing project:build
```
This will build govCMS from the master branch which is not an official release. If you want to use an official release you can set the `build.git.ref` command to build from a git tag.

```
./vendor/bin/phing project:build -Dbuild.git.ref=7.x-2.0-beta10
```
