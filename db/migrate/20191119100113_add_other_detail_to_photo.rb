class AddOtherDetailToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :other_detail, :json
  end
end
