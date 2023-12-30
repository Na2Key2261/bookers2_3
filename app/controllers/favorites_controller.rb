class FavoritesController < ApplicationController
  def create
    # 1. パラメータから book_id を取得する
    book_id = params[:book_id]

    # 2. パラメータが存在するか、かつ該当する Book レコードが見つかるか確認する
    if book_id && (book = Book.find_by(id: book_id))
      # 3. Book レコードが見つかった場合はいいねを作成する
      favorite = current_user.favorites.new(book_id: book.id)
      favorite.save
      redirect_to book_path(book)
    else
      # 4. 該当する Book レコードが見つからない場合はエラーをハンドリングする
      flash[:alert] = "Book not found"
      redirect_to books_path
    end
  end
  

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end
end
