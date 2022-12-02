class CreateDungeons < ActiveRecord::Migration[5.2]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.string :kind
      t.string :hold
      t.boolean :cleared
      t.integer :visit_count

      t.timestamps
    end
  end
end
