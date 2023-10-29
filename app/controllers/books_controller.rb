class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

   def show
    @book = Book.find(params[:id])
   end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

   # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    #4 redirect_to '/book' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
 　book = Book.find(params[:id])  # データ（レコード）を1件取得
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end