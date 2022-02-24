class LikesController < ApplicationController

    before_action :authenticate_user! #authenticate_user!　サインイン済みユーザー飲みにアクセスを許可

    def create #@likeにはpost_idとuser_idの情報が入っている
        @like = current_user.likes.build(like_params) #buildメソッドを使いインスタンスを生成　like_paramsというメソッドを引数で呼び出す
        @post = @like.post #@like.postというコードで@likeに紐づく投稿の情報を持っている
        if @like.save
            respond_to :js #respond_toは返却するレスポンスのフォーマットを切り替える為のメソッド
        end                #いいねを押した際にリアルタイムでビューを反映させるためにフォーマットをJS形式でレスポンスを返す
    end

    def destroy
        @like = Like.find_by(id: params[:id])
        @post = @like.post
        if @like.destroy
            respond_to :js
        end
    end

    private
        def like_params #paramsとは送られてきたリクエスト情報をひとまとめにしたもの
            params.permit(:post_id) #permitで変更を加えるキーをpost_idとして指定
        end
end
