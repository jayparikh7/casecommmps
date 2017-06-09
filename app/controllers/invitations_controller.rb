class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all

    render("invitations/index.html.erb")
  end

  def show
    @invitation = Invitation.find(params[:id])

    render("invitations/show.html.erb")
  end

  def new
    @invitation = Invitation.new

    render("invitations/new.html.erb")
  end

  def create
    @invitation = Invitation.new

    @invitation.creator_id = params[:creator_id]
    @invitation.member_id = params[:member_id]
    @invitation.accepted = params[:accepted]
    @invitation.team_id = params[:team_id]

    save_status = @invitation.save

    if save_status == true
      redirect_to("/invitations/#{@invitation.id}", :notice => "Invitation created successfully.")
    else
      render("invitations/new.html.erb")
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])

    render("invitations/edit.html.erb")
  end

  def update
    @invitation = Invitation.find(params[:id])

    @invitation.creator_id = params[:creator_id]
    @invitation.member_id = params[:member_id]
    @invitation.accepted = params[:accepted]
    @invitation.team_id = params[:team_id]

    save_status = @invitation.save

    if save_status == true
      redirect_to("/invitations/#{@invitation.id}", :notice => "Invitation updated successfully.")
    else
      render("invitations/edit.html.erb")
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])

    @invitation.destroy

    if URI(request.referer).path == "/invitations/#{@invitation.id}"
      redirect_to("/", :notice => "Invitation deleted.")
    else
      redirect_to(:back, :notice => "Invitation deleted.")
    end
  end
end
