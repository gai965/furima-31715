class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,             null: false, default: ""
      t.text       :explanation,      null: false, default: ""
      t.integer    :category_id,      null: false, default: ""
      t.integer    :condition_id,     null: false, default: ""
      t.integer    :delivery_fee_id,  null: false, default: ""
      t.integer    :prefecture_id,    null: false, default: ""
      t.integer    :delivery_days_id, null: false, default: ""
      t.integer    :price,            null: false, default: ""
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
