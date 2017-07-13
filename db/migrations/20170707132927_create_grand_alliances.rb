Hanami::Model.migration do
  change do
    create_table :grand_alliances do
      column :name, String, primary_key: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
