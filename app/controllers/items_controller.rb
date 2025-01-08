# class ItemsController < ApplicationController
#   before_action :set_item, only: %i[ show edit update destroy ]

#   # PATCH /lists/:list_id/items/:id/move_up
#   def move_up
#     @item.move_higher
#     redirect_to list_path(@list), notice: "Item movido para cima."
#   end

#   # PATCH /lists/:list_id/items/:id/move_down
#   def move_down
#     @item.move_lower
#     redirect_to list_path(@list), notice: "Item movido para baixo."
#   end

#   private

#   def set_list
#     @list = List.find(params[:list_id])
#   end

#   def set_item
#     @item = @list.items.find(params[:id])
#   end

#   # GET /items or /items.json
#   def index
#     @items = Item.all
#   end

#   # GET /items/1 or /items/1.json
#   def show
#   end

#   # GET /items/new
#   def new
#     @item = Item.new
#   end

#   # GET /items/1/edit
#   def edit
#   end

#   # POST /items or /items.json
#   def create
#     @item = Item.new(item_params)

#     respond_to do |format|
#       if @item.save
#         format.html { redirect_to @item, notice: "Item was successfully created." }
#         format.json { render :show, status: :created, location: @item }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /items/1 or /items/1.json
#   def update
#     respond_to do |format|
#       if @item.update(item_params)
#         format.html { redirect_to @item, notice: "Item was successfully updated." }
#         format.json { render :show, status: :ok, location: @item }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /items/1 or /items/1.json
#   def destroy
#     @item.destroy!

#     respond_to do |format|
#       format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_item
#       @item = Item.find(params.expect(:id))
#     end

#     # Only allow a list of trusted parameters through.
#     def item_params
#       params.expect(item: [ :name, :due_date, :completed, :position, :list_id ])
#     end
# end

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
    params.require(:item).permit(:name, :due_date, :completed)
  end
end
