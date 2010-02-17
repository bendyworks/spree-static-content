class CreatePagesTaxons < ActiveRecord::Migration
  def self.up
    create_table :pages_taxons do |t|
      t.integer :page_id, :null => false
      t.integer :taxon_id, :null => false
    end
    add_index :pages_taxons, :page_id
    add_index :pages_taxons, :taxon_id
  end

  def self.down
    remove_index :pages_taxons, :taxon_id
    remove_index :pages_taxons, :page_id
    drop_table :pages_taxons
  end
end
