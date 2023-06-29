<?php

/**
 * Implements hook_post_update_NAME().
 */
function gt_ma_cb_post_update_move_cas_table_02(&$sandbox) {

  if (empty($sandbox)) {
    $sandbox = [
      'current' => 0,
      'processed' => 0,
      'batch' => 500,
    ];
  }
  $fields = [
    'aid',
    'uid',
    'cas_name',
  ];
  // Get batch of records to update.
  $select = \Drupal\Core\Database\Database::getConnection('default','legacy')->select('cas_user', 'cu');
  $select->fields('cu', $fields);
  $select->range($sandbox['current'], $sandbox['batch']);
  $select->orderBy('cu.uid');

  $records = $select->execute()->fetchAllAssoc('uid');


  // Record number of records in this run.
  $count = 0;

  foreach ($records as $row) {
    \Drupal\Core\Database\Database::getConnection()->merge('authmap')
      ->keys([
        'uid' => $row->uid,
        'provider' => 'cas',
      ])
      ->fields([
        'authname' => $row->cas_name,
        'data' => NULL,
      ])
      ->execute();
    $count++;
  }

  $sandbox['current'] += $count;

  $sandbox['#finished']  = ($count == 0);

  return 'Results: count = ' . $count . ' current row =' . $sandbox['current'];
}
