Sequel.migration do

  up do
    run <<SQL
  CREATE TABLE `following_histories` (
    `id` integer PRIMARY KEY AUTOINCREMENT,
    `followings` text,
    `followed` text,
    `removed` text,
    `created_at` TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
SQL
  end

  down do
    drop_table :following_histories
  end

end
