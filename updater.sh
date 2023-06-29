#!/bin/bash

### Options ###
while getopts d:g option
do
case "${option}"
in
d) PROJECTPATH=${OPTARG};;
g) GNUCOMP=true;;
esac
done



### Project path? ###
if [ -z "$PROJECTPATH" ]; then
	echo -n "Enter the full path to your project's root directory: "
	read -e PROJECTPATH
fi

cd $PROJECTPATH



### Use GNU sed ###
if [ "$GNUCOMP" = true ]; then
    SED=gsed
else
    SED=sed
fi



### Update repository info ###
echo "Replacing outdated repository information."

$SED -i 's/_curie\.git/.git/g' composer.json
$SED -i 's/-8\.x\.git/.git/g' composer.json



### Update module constraints ###
echo "Updating module constraints for D9 compatibility."

rm composer.lock
$SED -i 's/"gt\/gt_profile_curie": ".*"/"gt\/gt_profile": "^3.0"/g' composer.json
$SED -i 's/"gt\/gt_theme": ".*"/"gt\/gt_theme": "^3.0"/g' composer.json
$SED -i 's/"gt\/gt_tools": ".*"/"gt\/gt_tools": "^3.0"/g' composer.json
$SED -i 's/"drush\/drush": ".*"/"drush\/drush": "^10.0"/g' composer.json
$SED -i 's/"drupal\/devel": ".*"/"drupal\/devel": "^4.0"/g' composer.json
$SED -i 's/"drupal\/views_taxonomy_term_name_depth": ".*"/"drupal\/views_taxonomy_term_name_depth": "^7.0"/g' composer.json
$SED -i 's/"drupal\/faqfield": ".*"/"drupal\/faqfield": "^7.0"/g' composer.json
$SED -i 's/"drupal\/views_accordion": ".*"/"drupal\/views_accordion": "^2.0"/g' composer.json
$SED -i 's/"drupal\/webform": ".*"/"drupal\/webform": "^6.0"/g' composer.json
$SED -i 's/"drupal\/core": ".*",*//g' composer.json
$SED -i 's/"drupal\/core-dev": ".*",*//g' composer.json
$SED -i 's/"webflo\/drupal-core-require-dev": ".*",*//g' composer.json



### Install D9 ###
composer require 'drupal/core-recommended:^9' 'drupal/core-composer-scaffold:^9' 'drupal/core-project-message:^9' --update-with-dependencies --no-update
composer update -W



echo "Finished. If you do not see any errors (ignore warnings of abandoned packages) go to yoursite.gatech.edu/update.php to update your site's database."
