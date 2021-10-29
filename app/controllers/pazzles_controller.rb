class PazzlesController < ApplicationController
    before_action :set_pazzle!, only: %i[show edit update destroy]

    def index
        @pazzles = Pazzle.all
    end

    def new
        @pazzle = Pazzle.new
    end
    
    def create
        @pazzle = current_user.pazzles.build pazzle_params
            if @pazzle.save
                flash[:success] = "Pazzle created!"
                redirect_to pazzles_path
            else
                render :new
            end
    end
    
    
    def show
        @user_solution = @pazzle.user_solutions.build
        @user_solutions = User_solution.order created_at: :desc
    end
    
    def edit

    end
    
    def update
        if @pazzle.update pazzle_params
          flash[:success] = "Pazzle updated!"
          redirect_to pazzles_path
        else
          render :edit
        end
    end

    def destroy
        @pazzle.destroy
        flash[:success] = "Pazzle deleted!"
        redirect_to pazzles_path
    end
    
    private
    
      def pazzle_params
        params
            .require(:pazzle)
            .permit(:title, :body, :solution, :author_id)
      end
    
      def set_pazzle!
        @pazzle = pazzle.find params[:id]
      end
end