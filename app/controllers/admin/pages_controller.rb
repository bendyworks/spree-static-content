class Admin::PagesController < Admin::BaseController
  resource_controller
  before_filter :set_taxons, :except => [:index]
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  update.after do
    expire_page :controller => 'static_content', :action => 'show', :path => @page.slug
    Rails.cache.delete('page_not_exist/'+@page.slug)
  end
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.after do
    Rails.cache.delete('pag_not_exist/'+@page.slug)
  end
  
private
  def set_taxons
    @taxons = @page.taxons
  end
end
