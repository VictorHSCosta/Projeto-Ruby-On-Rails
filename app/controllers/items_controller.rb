class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[edit update destroy move_up move_down]

  def show
    @item = @list.items.find(params[:id])
  end

  # POST /lists/:list_id/items
  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to list_path(@list), notice: "Item criado com sucesso!"
    else
      redirect_to list_path(@list), alert: "Não foi possível criar o item."
    end
  end

  # GET /lists/:list_id/items/:id/edit
  def edit; end

  # PATCH/PUT /lists/:list_id/items/:id
  def update
    if @item.update(item_params)
      redirect_to list_path(@list), notice: "Item atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @item = @list.items.find(params[:id])
      @item.destroy
      redirect_to list_path(@list), notice: "Item excluído com sucesso!"
    end

  # PATCH /lists/:list_id/items/:id/move_up
  def move_up
    @item.move_higher
    redirect_to list_path(@list), notice: "Item movido para cima."
  end

  # PATCH /lists/:list_id/items/:id/move_down
  def move_down
    @item.move_lower
    redirect_to list_path(@list), notice: "Item movido para baixo."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :due_date, :completed)
  end
end
