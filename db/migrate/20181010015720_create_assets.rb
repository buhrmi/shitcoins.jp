class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :native_symbol
      
      t.integer :submitter_id, comment: 'User ID of user who submitted this token. He should be made admin of this token.'

      t.float :cached_rating, default: 0
      t.string :platform_id
      t.string :address
      
      t.json :platform_data, default: {}, comment: 'Cached information for the asset. Pulled from the platform upon creation'

      t.timestamp :delisted_at
      
      
      t.string :logo_uid
      t.string :logo_name

      t.timestamps

      t.index [:address, :platform_id], unique: true
      t.index :name
    end
  end
end
