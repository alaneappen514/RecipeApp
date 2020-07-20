class CreateRecipeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_users do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null:false
    end
  end
end
