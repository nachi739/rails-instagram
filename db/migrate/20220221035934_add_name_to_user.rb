class AddNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false #ユーザー作成の際、必ず名前を入力させるため「null: false」
  end
end
