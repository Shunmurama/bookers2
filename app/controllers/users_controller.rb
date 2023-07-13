class UsersController <ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      render :index
    end
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully update."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private



  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


    def is_matching_login_user
      user = User.find(params[:id])
      login_user = current_user
      if(user.id != login_user.id)
        redirect_to books_path
      end
    end

end