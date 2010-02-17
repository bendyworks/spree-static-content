# Put your extension routes here.

map.namespace :admin do |admin|
  admin.resources :pages do |page|
    page.resources :taxons, :as => 'pages_taxons', :member => {:select => :post, :remove => :post}, :collection => {:available => :post, :selected => :get}
  end
end 
map.static '/static/*path', :controller => 'static_content', :action => 'show'
