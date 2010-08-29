class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
			t.string :name
			t.string :firstname
			t.integer :country_id
			t.integer :birthdate
			t.integer :deathdate
      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
