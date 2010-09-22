Sequel.migration do

  up do
    run <<SQL
CREATE TABLE `follow_differences` (
    `id` integer PRIMARY KEY AUTOINCREMENT,
    `following` text,
    `removing`  text,
    `followed`  text,
    `removed`   text,
    `created_at` TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
SQL
  end

  down do
    drop_table :follow_differences
  end

end
