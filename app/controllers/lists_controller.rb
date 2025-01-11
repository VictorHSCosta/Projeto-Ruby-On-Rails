class ListsController < ApplicationController
  # Exige que o usuário esteja logado antes de qualquer ação
  before_action :authenticate_user!
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists or /lists.json
  def index
    # Filtra apenas as listas do usuário logado
    @lists = current_user.lists
  end

  # GET /lists/1 or /lists/1.json
  def show
    @list = List.find(params[:id])
    @items = @list.items # Carrega os itens da lista

    respond_to do |format|
      format.html # Renderiza o show.html.erb
      format.turbo_stream # Caso esteja usando filtros dinâmicos com Turbo Streams
    end
  end


  # GET /lists/new
  def new
    # Cria uma nova lista associada ao usuário logado
    @list = current_user.lists.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists or /lists.json
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "Lista criada com sucesso." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "Lista atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_path, status: :see_other, notice: "Lista excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_list
      # Garante que apenas listas do usuário logado sejam acessíveis
      @list = current_user.lists.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end
end
