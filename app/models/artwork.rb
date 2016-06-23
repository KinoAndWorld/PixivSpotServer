class Artwork < ActiveRecord::Base

  self.table_name = "Artwork"
  self.primary_key = 'id'

  belongs_to :feature,
    :class_name => "Feature",
    :foreign_key => 'feature_id'

end
