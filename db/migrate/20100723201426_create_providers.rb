class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
