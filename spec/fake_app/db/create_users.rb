class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.string :cpf
      u.string :name
    end
  end

  def self.down
    drop_table :users
  end
end