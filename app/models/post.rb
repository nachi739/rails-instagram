class Post < ApplicationRecord

    belongs_to :user #userテーブルと１対多の関係(postsが多)

    has_many :photos, dependent: :destroy #photosテーブルと１対多の関係(postが1)
                    #dependent: :destroy オブジェクト削除時に関連付けられたオブジェクトのdestroyメソッドが実行される

    has_many :likes, -> { order(created_at: :desc) },dependent: :destroy #likesテーブルと１対多の関係(postが１)
                                                    #投稿削除時に投稿に紐づくいいねも削除

    has_many :comments, dependent: :destroy #１対多の関係(1) 投稿削除時に投稿に紐づくコメントも削除

    accepts_nested_attributes_for :photos #Photoモデルの親モデルのため追記
    #accepts_nested_attributes_forは、親子関係のある関連モデル(Postモデル・Photoモデル)でおやから子を作成したり保存するときに使用する

    def liked_by(user)
        Like.find_by(user_id: user.id, post_id: id) #user_idとpost_idが一致するlikeを検索する
    end

end
