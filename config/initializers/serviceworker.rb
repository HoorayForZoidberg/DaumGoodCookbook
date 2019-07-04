Rails.application.configure do
  config.serviceworker.routes.draw do
    match "/serviceworker.js" => "app/assets/javascripts/serviceworker.js"
    match "/manifest.json" => "app/assets/javascripts/manifest.json"
  end
end
