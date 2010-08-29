class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
			t.string :title
			t.integer :author_id
			t.integer :publisher_id
			t.integer :collection_id
			t.integer :owner_id
			t.integer :exemplar
			t.integer :printdate
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
