class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        #@user 先頭に@があるとインスタンス変数になり、コントローラからビュー変数を渡すことが出来る
                    #find_byは与えられた条件にマッチするレコードのうち最初のレコードだけを返す
                                #paramsとは送られてきたリクエスト情報をひとまとめにしてparams[:パラメータ名]という形式で取得
    end

end
