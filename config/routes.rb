# config/routes.rb
Rails.application.routes.draw do
  root "links#new"
  post "links", to: "links#create"
  
  get "links/:short_url/info", to: "links#info", as: :info_link

  get "/:short_url", to: "links#redirect", as: :short_redirect
end