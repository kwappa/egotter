Sequel.migration do

  up do
    create_table :follower_histories do
      primary_key :id
      String      :followers,   :text => true
      String      :followed,    :text => true
      String      :removed,     :text => true
      DateTime    :created_at
    end
  end

  down do
    drop_table :follower_histories
  end

end
