class PagesTaxon < ActiveRecord::Base
  belongs_to :page, :taxon
end