class Admin::PagesTaxonsController < Admin::BaseController
  include Railslove::Plugins::FindByParam::SingletonMethods
  resource_controller
  before_filter :load_object, :only => [:selected, :available]
  before_filter :load_taxon, :only => [:remove]
  belongs_to :page

  def selected
    @taxons = @page.taxons
  end

  def available
    if params[:q].blank?
      @available_taxons = Taxon.all
    else
      @available_taxons = Taxon.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_taxons.delete_if { |taxon| @page.taxons.include?(taxon) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def remove
    @page.taxons.delete(@taxon)
    @page.save
    @taxons = @page.taxons
    render :layout => false
  end

  def select
    @page = Page.find_by_param!(params[:page_id])
    taxon = Taxon.find(params[:id])
    @page.taxons << taxon
    @page.save
    @taxons = @page.taxons
    render :layout => false
  end

private
  def load_taxon
    debugger
    puts params
  end
end