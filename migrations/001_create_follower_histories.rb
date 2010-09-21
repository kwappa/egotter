Sequel.migration do

  up do
    create_table :follower_histories do
      primary_key :id
      String      :followers,   :text => true
      String      :followed,    :text => true
      String      :removed,     :text => true
      DateTime    :created_at,  :null => false, :default => :CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table :follower_histories
  end

end
