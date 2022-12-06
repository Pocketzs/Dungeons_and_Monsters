Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/dungeons", to: "dungeons#index"
  get "/dungeons/new", to: "dungeons#new"
  post "/dungeons", to: "dungeons#create"
  get "/dungeons/:id", to: "dungeons#show"
  get "/dungeons/:id/edit", to: "dungeons#edit"
  patch "/dungeons/:id", to:"dungeons#update"
  get "/monsters", to: "monsters#index"
  get "/monsters/:id", to: "monsters#show"
  get "/monsters/:id/edit", to: "monsters#edit"
  patch "/monsters/:id", to: "monsters#update"
  get "/dungeons/:dungeon_id/monsters", to: "dungeon_monsters#index"
  get "/dungeons/:dungeon_id/monsters/new", to: "dungeon_monsters#new"
  post "/dungeons/:dungeon_id/monsters", to: "dungeon_monsters#create"
end
