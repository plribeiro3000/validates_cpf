class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |a|
      a.string :cpf
      a.string :name
    end
  end

  def self.down
    drop_table :admins
  end
end