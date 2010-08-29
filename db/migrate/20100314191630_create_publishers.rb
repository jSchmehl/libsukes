class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
			t.string :name
			t.string :street
			t.string :zip
			t.string :city
			t.string :tel
			t.integer :country_id
      t.timestamps
    end
  end

  def self.down
    drop_table :publishers
  end
end
