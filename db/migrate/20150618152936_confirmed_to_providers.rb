class ConfirmedToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :confirmed, :boolean, default: false
  end
end
