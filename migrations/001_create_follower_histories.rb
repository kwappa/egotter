Sequel.migration do

  up do
    run <<SQL
  CREATE TABLE `follower_histories` (
    `id` integer PRIMARY KEY AUTOINCREMENT,
    `followers` text,
    `followed` text,
    `removed` text,
    `created_at` TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
SQL
  end

  down do
    drop_table :follower_histories
  end

end
