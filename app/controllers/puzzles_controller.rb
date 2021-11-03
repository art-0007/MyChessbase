class PuzzlesController < ApplicationController
    before_action :set_puzzle!, only: %i[show edit update destroy]

    def index
        @puzzles = Puzzle.order(created_at: :desc)
        @puzzles = @puzzles.decorate
    end

    def new
        @puzzle = Puzzle.new
    end
    
    def create
        #binding.pry
        @puzzle = current_user.puzzles.build puzzle_params
            if @puzzle.save
                flash[:success] = "Puzzle created!"
                redirect_to puzzles_path
            else
                render :new
            end
    end
    
    
    def show
        @puzzle = @puzzle.decorate
        @solution = @puzzle.solutions.build
        @solution.decorate

    end
    
    def edit

    end
    
    def update
        #binding.pry
        if @puzzle.update puzzle_params
          flash[:success] = "Puzzle updated!"
          redirect_to puzzles_path
        else
          render :edit
        end
    end

    def destroy
        @puzzle.destroy
        flash[:success] = "Puzzle deleted!"
        redirect_to puzzles_path
    end
    
    private

    def set_puzzle!
        @puzzle = Puzzle.find params[:id]
    end

    def puzzle_params
        params
            .require(:puzzle)
            .permit(:title, :body, :solution, :user_id, :image)
    end
          
end


