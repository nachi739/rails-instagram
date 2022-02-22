class PostsController < ApplicationController

    before_action :authenticate_user! #サインインしていない状態でnew・createアクションを実行しようとするとサインインページにリダイレクト
    #before_actionはアクションを実行する前にフィルターをかけるメソッド

    def new #new インスタンスを作成するメソッド
        @post = Post.new    #@postはビューでフォームを作成する際に使う newメソッドを使ってインスタンスを生成
        @post.photos.build  #build newと同じインスタンスを作成するメソッド buildとnewに違いはない
    end                     #Railsの慣習でモデルを関連付けしたときにbuildを使う(PostモデルとPhotoモデルの関連付け)

    def create
        @post = Post.new(post_params) #newメソッドを使いインスタンスを生成　　　post_paramsというメソッドを引数で呼び出す
        if @post.photos.present? #投稿の写真が存在するか確認    present?はnilまたは空のオブジェクトでなければtrueを返す
            @post.save #saveメソッドはオブジェクト(@post)をデータベースに保存
            redirect_to root_path #redirect_toで指定したページ(root_path)に遷移させる
            flash[:notice] = "投稿が保存されました"
        else
            redirect_to root_path #投稿が保存されなくてもroot_pathにリダイレクトする
            flash[:notice] = "投稿に失敗しました"
        end
    end

    private #privateメソッドを呼び出すときは、レシーバを指定することは出来ません
            #レシーバとは、あるオブジェクトに対してメソッドを実行しようとした場合、そのメソッドに働きかけるオブジェクトのこと
    def post_params
        params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
        #paramsとは送られてきたリクエスト情報をひとまとめにしたもの
        #requireで受け取る値のキーを設定します
        #permitで変更を加えられるキーを指定します   captionキーとimageキーを指定
        #mergeメソッドは２つのハッシュメソッドを統合するメソッド。  誰が投稿したかという情報が必要なためuser_idの情報を統合
    end

end
