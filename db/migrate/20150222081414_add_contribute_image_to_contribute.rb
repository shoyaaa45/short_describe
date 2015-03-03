class AddContributeImageToContribute < ActiveRecord::Migration
  def change
    add_column :contributes, :contribute_image, :string
  end
end
