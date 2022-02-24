class Like < ApplicationRecord

    belongs_to :user #userテーブルと1対多の関係(likeが多)

    belongs_to :post #postテーブルと１対多の関係(likeが多)

    validates :user_id, uniqueness: {scope: :post_id} #user_id post_idの組み合わせが重複していないか検証
                        #uniquenessはオブジェクトが保存される直前に、属性の値が一意(unique)であり重複していないか検証

end
