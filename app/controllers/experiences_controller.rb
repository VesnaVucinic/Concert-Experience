class ExperiencesController < ApplicationController
  def new
    #if it's nested and why find the post
    if @concert = Concert.find_by_id(params[:concert_id])
      @experience = @concert.experiences.build
    else
      @experience = Experience.new
    end
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.concert_id = params[:concert_id]
    
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def index
    if @concert = Concert.find_by_id(params[:concert_id])
      @experiences = @concert.experiences.concert_rating
    else
      @experiences = Experience.concert_rating
    end
  end


  def show
    @experience = Experience.find_by_id(params[:id])
  end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating, :concert_id)
      end

    end