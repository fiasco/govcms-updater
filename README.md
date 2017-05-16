# govCMS Updater
A building script for managing govCMS updates for downstream PaaS projects.
## Installation
Add this composer package as a `dev` dependency to your D7 govCMS site.

```
composer require --dev fiasco/govcms-updater
```

When running `govcms-updater`, it will create a build artifact called `_build` in
your project root. It will be a good idea to not commit this to your VCS.

```
echo "_build" >> .gitignore
```

## Creating a new Project or Updating an existing project
To create a new govCMS project or to update an existing one, run this command:

```
./vendor/bin/govcms-updater
```

This will generate two directories in the project root: `docroot` and `_build`.
`_build` is purely a build artifact and can be removed.

 If you want to use an official release you can pass a release tag as an argument.

```
./vendor/bin/govcms-updater 7.x-2.10
```

## Managing a local govCMS project
govcms-updater will overwrite the contents of `docroot` with the contents of
govCMS when run with the exception of `docroot/sites` which will be preserved.
Any local modules (such as feature exports), themes, libraries and site
configuration should be stored in `docroot/sites` to avoid it being overridden.

### Using the govcms-updater hooks system
govcms-updater comes with hooks that can run scripts before and after the import
phase of the update where the govCMS update replaces the existing docroot folder.
These hooks can be used to preserve and re-establish modifications to govCMS
that are tracked locally only such as patches.

For example, you may enforce SSL through a modification to `.htaccess` or store
additional assets like a style guide under the webroot.

To use these hooks, copy the templates from the `hooks` directory into a `scripts`
directory in the root of your repository.

```
[ -d scripts ] || mkdir scripts
cp ./vendor/fiasco/govcms-updater/hooks/govcms-updater-post-import.sh scripts/
cp ./vendor/fiasco/govcms-updater/hooks/govcms-updater-pre-import.sh scripts/
```
