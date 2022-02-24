class User < ApplicationRecord

  has_many :posts, dependent: :destroy #postsテーブルと１対多の関係(userが1)

  has_many :likes #likesテーブルと1対多の関係(userが１)

  has_many :comments #１対多の関係(1)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50} #登録するユーザー名は５０文字のバリデーション

  def update_without_current_password(params,*options)

    if params[:password].blank? && params[:password_confirmation].blank? #パスワード変更の為のパスワード入力フィールド・確認フィールドの両者とも殻の場合のみ、パスワードなしで更新
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

end
