Hanami::Model.migration do
  change do
    create_table :armies do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)
      foreign_key :grand_alliance_name, :grand_alliances, type: String, null: false, index: true, on_delete: :cascade

      column :name, String, null: false, unique: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
