class CreateAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :image
      t.boolean :publish  
      t.timestamps
    end
  end
end
