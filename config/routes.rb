# config/routes.rb
Rails.application.routes.draw do
  root "links#new"
  post "links", to: "links#create"
  
  get "links/:url_short/info", to: "links#info", as: :info_link

  get "/:url_short", to: "links#redirect", as: :short_redirect
end