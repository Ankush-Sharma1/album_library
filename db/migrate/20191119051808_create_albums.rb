class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
    end
  end
end
