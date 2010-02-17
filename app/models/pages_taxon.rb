class PagesTaxon < ActiveRecord::Base
  belongs_to :page
  belongs_to :taxon
end