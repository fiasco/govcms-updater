# govCMS Updater
A building script for managing govCMS updates for downstream PaaS projects.
## Installation
Run this as apart of your govCMS site project. You can either download a release from github or clone it directly into your existing working project.

```
git clone https://github.com/fiasco/govcms-updater.git
```
Once download, you'll need to install the [composer](https://getcomposer.org/) dependancies.

**Note:** Be sure not to commit this to git as a submodule. It may be best to not track it at all.

```
cd govcms-updater && composer install
```
## Creating a new Project or Updating an existing project
To create a new govCMS project or to update an existing one, run this command:

```
./govcms-updater/updater.sh
```
This will build govCMS in a folder called `docroot` next to the govcms-updater project.
This will build govCMS from the master branch which is not an official release. If you want to use an official release you can pass a release tag as an argument.

```
./govcms-updater/updater.sh 7.x-2.0-beta10
```

## Managing a local govCMS project
govcms-updater will overwrite the contents of `docroot` with the contents of govCMS when run with the exception of `docroot/sites` which will be preserved. Any local modules (such as feature exports), themes, libraries and site configuration should be stored in `docroot/sites` to avoid it being overridden.

### Using the govcms-updater hooks system
govcms-updater comes with hooks that can run scripts before and after the import phase of the udpate where the govCMS update replacees the existing docroot folder. These hooks can be used to preserve and re-establish modifications to govCMS that are tracked locally only such as patches.

For example, you may enforce SSL through a modification to `.htaccess` or store additional assets like a style guide under the webroot.

To use these hooks, simple remove the ".disabled" extension from the shell scripts in the `hooks` directory.

```
mv hooks/post-import.sh.disabled hook/post-import.sh
mv hooks/pre-import.sh.disabled hook/pre-import.sh
```
