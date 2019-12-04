class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :message
      t.string :intro

      t.timestamps
    end
  end
end
