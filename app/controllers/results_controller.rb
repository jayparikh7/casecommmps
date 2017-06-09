class ResultsController < ApplicationController
  def index
    @results = Result.all

    render("results/index.html.erb")
  end

  def show
    @result = Result.find(params[:id])

    render("results/show.html.erb")
  end

  def new
    @result = Result.new

    render("results/new.html.erb")
  end

  def create
    @result = Result.new

    @result.competition_id = params[:competition_id]
    @result.team_id = params[:team_id]
    @result.description = params[:description]

    save_status = @result.save

    if save_status == true
      redirect_to("/results/#{@result.id}", :notice => "Result created successfully.")
    else
      render("results/new.html.erb")
    end
  end

  def edit
    @result = Result.find(params[:id])

    render("results/edit.html.erb")
  end

  def update
    @result = Result.find(params[:id])

    @result.competition_id = params[:competition_id]
    @result.team_id = params[:team_id]
    @result.description = params[:description]

    save_status = @result.save

    if save_status == true
      redirect_to("/results/#{@result.id}", :notice => "Result updated successfully.")
    else
      render("results/edit.html.erb")
    end
  end

  def destroy
    @result = Result.find(params[:id])

    @result.destroy

    if URI(request.referer).path == "/results/#{@result.id}"
      redirect_to("/", :notice => "Result deleted.")
    else
      redirect_to(:back, :notice => "Result deleted.")
    end
  end
end
