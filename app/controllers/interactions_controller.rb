class InteractionsController < ApplicationController
  before_action :set_interaction!, only: %i[destroy edit show update]
  before_action :fetch_places, only: %i[create edit new]

  def index
    @interactions = current_user.interactions
  end

  def show
    
  end

  def create

    if user_signed_in?
      @interaction = current_user.interactions.build interaction_donate_params
    else
      @interaction = Interaction.new interaction_donate_params
    end

    debugger
    if @interaction.save
      flash[:success] = 'Спасибо! Ваша заявка отправлена'
      redirect_to root_path
    else
      render :new
    end
  end
  
  
  def new
    @interaction = Interaction.new
  end

  def donate
    @interaction = Interaction.new
  end

  private


  def set_interaction!
    @interaction = Interaction.find params[:id]
  end

  def fetch_places
    @places = Place.order(:name).map { |place| [place.place_name, place.id] }
  end

  def interaction_donate_params
    params.require(:interaction).permit(:book_title, :book_author, :phone_number, :place_id)
  end
end