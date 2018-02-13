class CreateGamePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :game_positions do |t|
      t.integer :word_id
      t.integer :color_id
      t.boolean :guessed
    end
  end
end
