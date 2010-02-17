class PageTaxon < ActiveRecord::Base
  belongs_to :page, :taxon
  
  
end