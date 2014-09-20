class WishpondTestsController < ApplicationController
  before_action :set_wishpond_test, only: [:show, :edit, :update, :destroy]

  # GET /wishpond_tests
  # GET /wishpond_tests.json
  def index
    @wishpond_tests = WishpondTest.all
  end

  # GET /wishpond_tests/1
  # GET /wishpond_tests/1.json
  def show
  end

  # GET /wishpond_tests/new
  def new
    @wishpond_test = WishpondTest.new
  end

  # GET /wishpond_tests/1/edit
  def edit
  end

  # POST /wishpond_tests
  # POST /wishpond_tests.json
  def create
    @wishpond_test = WishpondTest.new(wishpond_test_params)

    respond_to do |format|
      if @wishpond_test.save
        format.html { redirect_to @wishpond_test, notice: 'Wishpond test was successfully created.' }
        format.json { render :show, status: :created, location: @wishpond_test }
      else
        format.html { render :new }
        format.json { render json: @wishpond_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishpond_tests/1
  # PATCH/PUT /wishpond_tests/1.json
  def update
    respond_to do |format|
      if @wishpond_test.update(wishpond_test_params)
        format.html { redirect_to @wishpond_test, notice: 'Wishpond test was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishpond_test }
      else
        format.html { render :edit }
        format.json { render json: @wishpond_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishpond_tests/1
  # DELETE /wishpond_tests/1.json
  def destroy
    @wishpond_test.destroy
    respond_to do |format|
      format.html { redirect_to wishpond_tests_url, notice: 'Wishpond test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishpond_test
      @wishpond_test = WishpondTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishpond_test_params
      params.require(:wishpond_test).permit(:first_name, :last_name, :bio, :email)
    end
end
