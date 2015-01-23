class Uploader < CarrierWave::Uploader::Base
  
  ##
  # Image manipulator library:
  #
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick
  
  version :big do
    process :resize_to_fit => [800, 600]
  end

      version :medium do
        process :resize_to_fit => [205, 205]
      end

      version :thumb do
        process :resize_to_fit => [90, 90]
      end
  ##
  # Storage type
  # configure do |config|
  #   config.fog_credentials = {
  #     :provider               => 'AWS',                        # required
  #     :aws_access_key_id      => 'AKIAJ2YZSQBSLYH6PGXA',                        # required
  #     :aws_secret_access_key  => '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',                        # required
  #     :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
  #  }
  #   config.fog_directory  = 'sayanmarket'                          # required
  #   config.fog_public     = true                                        # optional, defaults to true
  #   config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  # end
  
  configure do |config|
    config.permissions = 0777
    #config.directory_permissions = 0777
    config.storage = :file
  end

  ## Manually set root
  #def root; File.join(Padrino.root,"public/"); end

  ##
  # Directory where uploaded files will be stored (default is /public/uploads)
  #
  def store_dir
    Padrino.root("/public/upload")
  end

  ##
  # Directory where uploaded temp files will be stored (default is [root]/tmp)
  #
  def cache_dir
    Padrino.root("tmp/upload")
  end

  ##
  # Default URL as a default if there hasn't been a file uploaded
  #
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  ##
  # Process files as they are uploaded.
  #
  # process :resize_to_fit => [740, 580]

  ##
  # Create different versions of your uploaded files
  #
  # version :header do
  #   process :resize_to_fill => [940, 250]
  #   version :thumb do
  #     process :resize_to_fill => [230, 85]
  #   end
  # end
  ##
  # White list of extensions which are allowed to be uploaded:
  #
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  ##
  # Override the filename of the uploaded files
  #
  # def filename
  #   "something.jpg" if original_filename
  # end
end
