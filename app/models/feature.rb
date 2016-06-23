class Feature < ActiveRecord::Base

  has_many :artworks,
    :class_name => 'Artwork',
    :foreign_key => 'feature_id'

  self.table_name = "Feature"
  self.primary_key = 'id'
end
