class RegistrationsController < Devise::RegistrationsController

    protected #自分のクラス内、もしくはその継承先のクラスでアクセス可能

    def update_resource(resource,params)
        resource.update_without_current_password(params)
        #resource.update_without_current_passwordは、パスワードを入力せずに更新できるメソッド
    end

    def after_update_path_for(resource) #update後にtop画面にリダイレクトするメソッド
        user_path(resource)
    end

end