class Post < ApplicationRecord

    belongs_to :user #userテーブルと１対多の関係(postsが多)

    has_many :photos, dependent: :destroy #photosテーブルと１対多の関係(postが1)

    accepts_nested_attributes_for :photos #Photoモデルの親モデルのため追記
    #accepts_nested_attributes_forは、親子関係のある関連モデル(Postモデル・Photoモデル)でおやから子を作成したり保存するときに使用する

end
