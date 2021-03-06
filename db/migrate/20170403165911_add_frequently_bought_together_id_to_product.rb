class AddFrequentlyBoughtTogetherIdToProduct < ActiveRecord::Migration
  def change

    drop_table(:products)

    create_table :products do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.text :brief_description
      t.text :full_description
      t.decimal :price, null: false
      t.decimal :discount, default: 0
      t.boolean :on_sale, defaulf: false
      t.boolean :storefront, default: false
      t.integer :frequently_bought_together_id

      t.timestamps null: false
    end
    add_index :products, :title
  end
end
