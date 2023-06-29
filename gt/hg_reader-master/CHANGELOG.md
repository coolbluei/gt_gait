Mercury Reader 2.12, 2022-12-16
-------------------------------
- Fixed another disappearing data issue, with related links on events
- Fixed a timezone issue in the default view templates

Mercury Reader 2.11, 2022-12-7
------------------------------
- Fixed the stupid version number

Mercury Reader 2.10, 2022-12-6
------------------------------
- Fixes bug in which taxonomy terms disappear when nodes are updated.
- Fixes similar bug affecting images.
- Fixes yet another bug in which related links disappear.
- Fixes location url title update issues in events.

Mercury Reader 2.9, 2022-07-05
------------------------------
- Lots of new fields added to profiles, along with importer support.
- Groups field added to events, plus importer support.

Mercury Reader 2.8, 2022-01-19
------------------------------
- Fixed a bug in which the Reader was unable to determine whether it had already pulled events with repeats.

Mercury Reader 2.7, 2022-01-06
-------------------------------
- Check for empty images

Mercury Reader 2.6, 2021-11-15
------------------------------
- Keyword, categories, news room topics, core research areas, and event categories are now properly mapped when nodes are updated.
- Default event and news blocks have been significantly redeveloped to be, well, let's be honest -- functional.
- "Download image" link added to images.
- Changed css to use classes instead of IDs.
- Improved uninstall functionality.
- Added support for repeating dates.

Note that this update contains a slew of changes that might break your site. Please make note of the following:
- The module requires the Twig Tweak module. Composer should pick up this requirement and update.php should enable it, but your mileage may vary.
- The module makes changes to the default hg_events view -- if you have modified this view you will need to export your configuration, update the module, and then restore your configuration. Detailed instructions below.
- The module adds twig templates for teaser views and modifies the associated displays. If you have template overrides in your custom theme, you may need to adjust for this.
- The module's css has been modified to use classes instead of IDs. If you are overriding the ID declarations in your custom theme, you may need to modify the selectors.

Detailed instructions for folks wishing to preserve the default news and event views:
- Go to yoursite.gatech.edu/admin/config/development/configuration/single/export.
- Under "configuration type" choose "view."
- Under "configuration name" choose "Mercury events."
- Copy the configuration somewhere safe.
- Under "configuration name" choose "Mercury news."
- Copy this configuration somewhere safe as well.
- Update the module, run update.php.
- Go to yoursite.gatech.edu/admin/config/development/configuration/single/import.
- Under "configuration type" choose "view."
- Paste the Mercury event configuration you stored into the box and click "import."
- Do the same for the news configuration.

It is possible that the system will refuse to import the configuration due to dependent configuration entities left behind by very early versions of Mercury Reader. If this occurs, please contact webteam@gatech.edu and we will help you determine what needs to be removed (and how) in order to proceed.

Mercury Reader 2.5, 2021-10-26
------------------------------
Cleaned up the default events block.

Mercury Reader 2.4, 2021-08-09
------------------------------
Special new version for my wife's birthday, and also to fix a bug in an update hook (!) and some other little fixes. Added (some) video support.

Mercury Reader 2.3, 2021-07-16
------------------------------
Added more information to importer list. Fixed an issue with taxonomy terms.

Mercury Reader 2.2, 2021-07-08
------------------------------
Adds accessibility for "read more" links, non-traditional install paths, alpha sorting of importers, use of multiple feeds in a single importer, as well as bug fixes.

Mercury Reader 2.1, 2021-03-22
------------------------------
- A commit from 2.0 got left out somehow; restoring it.

Mercury Reader 2.0, 2021-03-19
------------------------------
- Mercury Reader 2.x, D8- and D9-compatible.
