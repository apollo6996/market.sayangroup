require 'carrierwave/datamapper'
class Upload
  include DataMapper::Resource
  #attr_accessor :file

  # property <name>, <type>
  property :id,   Serial
  property :file, Text, :auto_validation => false

  property :created_at, DateTime
  mount_uploader :file, Uploader

  belongs_to :item
end
