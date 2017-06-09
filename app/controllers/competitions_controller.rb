class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all

    render("competitions/index.html.erb")
  end

  def show
    @competition = Competition.find(params[:id])

    render("competitions/show.html.erb")
  end

  def new
    @competition = Competition.new

    render("competitions/new.html.erb")
  end

  def create
    @competition = Competition.new

    @competition.name = params[:name]
    @competition.sponsor = params[:sponsor]
    @competition.location = params[:location]
    @competition.description = params[:description]
    @competition.prize_money = params[:prize_money]
    @competition.topic = params[:topic]
    @competition.deadline = params[:deadline]

    save_status = @competition.save

    if save_status == true
      redirect_to("/competitions/#{@competition.id}", :notice => "Competition created successfully.")
    else
      render("competitions/new.html.erb")
    end
  end

  def edit
    @competition = Competition.find(params[:id])

    render("competitions/edit.html.erb")
  end

  def update
    @competition = Competition.find(params[:id])

    @competition.name = params[:name]
    @competition.sponsor = params[:sponsor]
    @competition.location = params[:location]
    @competition.description = params[:description]
    @competition.prize_money = params[:prize_money]
    @competition.topic = params[:topic]
    @competition.deadline = params[:deadline]

    save_status = @competition.save

    if save_status == true
      redirect_to("/competitions/#{@competition.id}", :notice => "Competition updated successfully.")
    else
      render("competitions/edit.html.erb")
    end
  end

  def destroy
    @competition = Competition.find(params[:id])

    @competition.destroy

    if URI(request.referer).path == "/competitions/#{@competition.id}"
      redirect_to("/", :notice => "Competition deleted.")
    else
      redirect_to(:back, :notice => "Competition deleted.")
    end
  end
end
