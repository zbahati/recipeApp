class GeneralShoppingListController < ApplicationController
  before_action :set_general_shopping_list, only: %i[ show edit update destroy ]

  # GET /general_shopping_lists or /general_shopping_lists.json
  def index
    @user = current_user
    @recipes = @user.recipes.includes(:recipe_foods, :foods)
  end

  # GET /general_shopping_lists/1 or /general_shopping_lists/1.json
  def show
  end

  # GET /general_shopping_lists/new
  def new
    @general_shopping_list = GeneralShoppingList.new
  end

  # GET /general_shopping_lists/1/edit
  def edit
  end

  # POST /general_shopping_lists or /general_shopping_lists.json
  def create
    @general_shopping_list = GeneralShoppingList.new(general_shopping_list_params)

    respond_to do |format|
      if @general_shopping_list.save
        format.html { redirect_to general_shopping_list_url(@general_shopping_list), notice: "General shopping list was successfully created." }
        format.json { render :show, status: :created, location: @general_shopping_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @general_shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_shopping_lists/1 or /general_shopping_lists/1.json
  def update
    respond_to do |format|
      if @general_shopping_list.update(general_shopping_list_params)
        format.html { redirect_to general_shopping_list_url(@general_shopping_list), notice: "General shopping list was successfully updated." }
        format.json { render :show, status: :ok, location: @general_shopping_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @general_shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_shopping_lists/1 or /general_shopping_lists/1.json
  def destroy
    @general_shopping_list.destroy!

    respond_to do |format|
      format.html { redirect_to general_shopping_lists_url, notice: "General shopping list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_shopping_list
      @general_shopping_list = GeneralShoppingList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def general_shopping_list_params
      params.require(:general_shopping_list).permit(:index)
    end
end
