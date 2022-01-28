class UsersBackoffice::BoardsController < UsersBackofficeController
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    @boards = Board.order(id: :desc).includes(:tasks).page params[:page]
  end

  def new
    @board = Board.new
  end

  def edit    
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to users_backoffice_boards_path, notice: "Assunto adicionado com sucesso!!"
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to users_backoffice_boards_path, notice: "Assunto atualizado com sucesso!!"
    else
      render :edit
    end
  end

  def destroy
    @board.destroy

    redirect_to users_backoffice_boards_path, notice: "Assunto removido com sucesso!!"
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :description, tasks_attributes: [:id, :title, :description, :start_time, :finish, :_destroy])
  end
end
