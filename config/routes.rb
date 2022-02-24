Rails.application.routes.draw do
  devise_for :users, #devise内のコントローラで処理をする際に、スコープを設定する処理 ↓細かく書いた際の記述
                    #devise_for(
                      #:users,            :users deviseのログインユーザーの対象となっているモデル
                      #path: 'users',     path   deviseで生成するURLの基準となるパス。これを書き換えればURLを変更できる
                      #module: 'devise'   module deviseのコントローラの場所を指している。
                    #)
    controllers: { registrations: 'registrations' }

  root 'posts#index'

  get '/users/:id',to:'users#show',as:'user' #ここにusersコントローラのshowアクションのルーティングを追加
      #/users/:の箇所に数字が入り数字の違いでユーザーの判別
                                  #as:'user'と記述することで'user_path'というメソッドが生成され、コントローラ・ヘルパー・ビューで使える様になる。

  #get '/posts/new', to:'posts#new' #postsコントローラのnewアクション。投稿ページを表示するルーティング
  #post '/posts', to:'posts#create' #postsコントローラのcreateアクション。投稿を作成するルーティング
  #post '/posts/:post_id/hotos', to:'photos#create', as:'post_photos' #photosコントローラのcreateアクション。投稿の写真を保存するルーティング
  #photosに関しては、どの投稿に紐づくのかのpost_idの情報がないといけないため、/photosの前に/posts/:post_idのパスがつく

  #resourcesメソッドは７つのアクションのルーティングを自動で生成します(index new create show edit update destroy)
  resources :posts,only: %i(index new create show) do #onlyを使うと自動で生成されるアクションを絞り込むことが出来る
    resources :photos, only: %i(create)    #ルーティングをネスト(入れ子)にすることで、親子関係をルーティングで表すことが出来る
  end                                      #photosはpostsに対して「子」の関係になるので、ネストすることで、どの投稿に紐づくのかを明示出来る

end
