Hanami::Model.migration do
  change do
    create_table :warscrolls do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)
      foreign_key :army_id, :armies, type: :uuid, null: false, index: true, on_delete: :cascade

      column :name, String, null: false, index: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
