class MaxPlayersToInt < ActiveRecord::Migration
  def change
  	change_column :lans, :max_players, :integer
  end
end
