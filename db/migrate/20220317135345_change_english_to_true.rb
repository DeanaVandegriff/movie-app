class ChangeEnglishToTrue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :movies, :english, true
  end
end
