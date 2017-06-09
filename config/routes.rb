Rails.application.routes.draw do
  # Routes for the Invitation resource:
  # CREATE
  get "/invitations/new", :controller => "invitations", :action => "new"
  post "/create_invitation", :controller => "invitations", :action => "create"

  # READ
  get "/invitations", :controller => "invitations", :action => "index"
  get "/invitations/:id", :controller => "invitations", :action => "show"

  # UPDATE
  get "/invitations/:id/edit", :controller => "invitations", :action => "edit"
  post "/update_invitation/:id", :controller => "invitations", :action => "update"

  # DELETE
  get "/delete_invitation/:id", :controller => "invitations", :action => "destroy"
  #------------------------------

  # Routes for the Result resource:
  # CREATE
  get "/results/new", :controller => "results", :action => "new"
  post "/create_result", :controller => "results", :action => "create"

  # READ
  get "/results", :controller => "results", :action => "index"
  get "/results/:id", :controller => "results", :action => "show"

  # UPDATE
  get "/results/:id/edit", :controller => "results", :action => "edit"
  post "/update_result/:id", :controller => "results", :action => "update"

  # DELETE
  get "/delete_result/:id", :controller => "results", :action => "destroy"
  #------------------------------

  # Routes for the Message resource:
  # CREATE
  get "/messages/new", :controller => "messages", :action => "new"
  post "/create_message", :controller => "messages", :action => "create"

  # READ
  get "/messages", :controller => "messages", :action => "index"
  get "/messages/:id", :controller => "messages", :action => "show"

  # UPDATE
  get "/messages/:id/edit", :controller => "messages", :action => "edit"
  post "/update_message/:id", :controller => "messages", :action => "update"

  # DELETE
  get "/delete_message/:id", :controller => "messages", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------

  # Routes for the Competition resource:

  # INDEX
  root to: "competitions#index"
  # CREATE
  get "/competitions/new", :controller => "competitions", :action => "new"
  post "/create_competition", :controller => "competitions", :action => "create"

  # READ
  get "/competitions", :controller => "competitions", :action => "index"
  get "/competitions/:id", :controller => "competitions", :action => "show"

  # UPDATE
  get "/competitions/:id/edit", :controller => "competitions", :action => "edit"
  post "/update_competition/:id", :controller => "competitions", :action => "update"

  # DELETE
  get "/delete_competition/:id", :controller => "competitions", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
