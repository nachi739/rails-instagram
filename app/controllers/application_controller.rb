class ApplicationController < ActionController::Base

    #deviseに関するストロングパラメータを記述する際は、application_controller.rbに記述する
    #(deviseの処理を行うコントローラはGem内に記述されており編集出来ないため。)

    protect_from_forgery with: :exception #クロスサイトリクエストフォージェリ (CSRF)への対応策のコード

    before_action :configure_permitted_parameters,if: :devise_controller?
    #configure_permitted_parametersというメソッドはdevise_controllerを使うときしか処理をしないということをApplicationコントローラを読み込む前に判断する

    protected #自分のクラス内、もしくはその継承先のクラスでアクセス可能

        def configure_permitted_parameters #nameカラムを保存できるようにストロングパラメータを追記
                                            #(:deviseの処理名, keys:[:許可するキー])
            devise_parameter_sanitizer.permit(:sign_up,keys:[:name]) #:sign_up ログインの処理を行う時
            devise_parameter_sanitizer.permit(:account_update,keys:[:name]) #account_update アカウント情報更新の処理を行う時
        end

end
