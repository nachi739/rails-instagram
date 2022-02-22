class Photo < ApplicationRecord

    belongs_to :post #postテーブルと１対多の関係(photoが多)

    validates :image, presence: true #写真を必ずアップロードするためのバリデーション

    mount_uploader :image,ImageUploader #PhotoモデルのimageカラムとアップローダーImageUploaderを紐付け
    #ImageUploaderはapp.uploadrs/image_uploader.rbのクラス名

end
