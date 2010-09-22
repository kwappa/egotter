Sequel.migration do

  up do
    run <<SQL
CREATE TABLE `followers` (
    `id` integer PRIMARY KEY AUTOINCREMENT,
    `followers` integer NOT NULL,
    `followers_list` text,
    `created_at` TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
SQL

    run <<SQL
CREATE TABLE `followings` (
    `id` integer PRIMARY KEY AUTOINCREMENT,
    `followings` integer NOT NULL,
    `followings_list` text,
    `created_at` TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
SQL
  end

  down do
    drop_table :followers
    drop_table :followings
  end

end
