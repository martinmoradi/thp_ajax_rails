class AddReadToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :read_status, :boolean
  end
end
