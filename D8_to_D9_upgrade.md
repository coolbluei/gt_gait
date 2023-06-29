Included in this distribution is a utility to aid in upading existing Drupal 8 sites to Drupal 9. Instructions follow:

1. If you have a repository (Git, CVS, or otherwise) for your code, make sure you have pulled the latest commits. If possible it's preferable to do this in a branch other than the default.
2. It is advisable to install the Update Status module (https://www.drupal.org/project/upgrade_status), especially if you have many third-party modules or custom code. DO NOT CONTINUE UNTIL YOU HAVE FIXED ALL THE WARNINGS THE MODULE ISSUES! This module does not fix incompatibilities; it only alerts you to them. 
2. Run update.php (or `drush updb`) to make sure there are no pending database updates.
3. Update the .info file for any installed subtheme of curie, making sure that:
    - The base theme should point to `gt`.
    - Replace the `core` key with `core_version_requirement: ^8.8 || ^9`.
    - Add the following regions:
      - footer_01: 'Footer first'
      - footer_02: 'Footer second'
      - footer_03: 'Footer third'
      - footer_04: 'Footer fourth'
      - footer_05: 'Footer fifth'
      - footer_06: 'Footer sixth'
      - footer_07: 'Footer seventh'
      - footer_08: 'Footer eighth'
      - alert: 'Alert'

4. Run updater.sh in gt_installer, supplying the path to the site root. If you're on a Mac you'll need to install gsed (via Macports or Homebrew) and run the command with the -g flag. If for any reason you have to do these steps manually, see the addendum below.
5. If the update process finishes without errors, run update.php or `drush updb`.
6. Assuming you don't encounter any unaniticipated problems, you should be finished.

---

*Addendum for manual updating:*

The updater removes the composer.lock file and makes the following modifications to your composer.json file:

1. Find and replace all '_curie.git' snippets with just '.git'.
2. Find and replace all '-8.x.git' snippets with just '.git'. This step and the one above ensures that Composer can find the proper repositories. 
3. Update _"gt/gt_profile_curie"_ constraint to _"gt\/gt_profile": "^3.0"_.
4. Update _"gt\/gt_theme"_ constraint to _"gt\/gt_theme": "^3.0"_.
5. Update _"gt\/gt_tools": ".*"/"gt\/gt_tools": "^3.0"/g' composer.json
6. Update _"drush\/drush" constraint to _"drush\/drush": "^10.0"_.
7. Update _"drupal\/devel" constraint to _"drupal\/devel": "^4.0"_.
8. Update _"drupal\/views_taxonomy_term_name_depth" constraint to _"drupal\/views_taxonomy_term_name_depth": "^7.0"_.
9. Update _"drupal\/faqfield" constraint to _"drupal\/faqfield": "^7.0"_.
10. Update _"drupal\/views_accordion" constraint to _"drupal\/views_accordion": "^2.0"_.
11. Update _"drupal\/webform" constraint to _"drupal\/webform": "^6.0"_.
12. Remove any instances of _"drupal\/core"_.
13. Remove any instances of _"drupal\/core-dev"_.
14. Remove any instances of _"webflo\/drupal-core-require-dev"_.

Your particular installation may lack one or more of these items. 

Finally, the script does:
- `composer require 'drupal/core-recommended:^9' 'drupal/core-composer-scaffold:^9' 'drupal/core-project-message:^9' --update-with-dependencies --no-update`
- `composer update -W`

*Additional documentation*

You might find solutions to any problems you might encounter in this over-the-shoulder look at working through a difficult upgrade: https://youtu.be/fLsBHeEh2iI

