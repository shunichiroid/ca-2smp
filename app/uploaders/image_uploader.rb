require "image_processing/mini_magick"

class ImageUploader < Shrine
    include ImageProcessing::MiniMagick
  
    plugin :processing
    plugin :activerecord
    plugin :determine_mime_type
    plugin :logging, logger: Rails.logger
    plugin :remove_attachment
    plugin :validation_helpers
    plugin :versions, names: [:original, :thumb]
  
    Attacher.validate do
      validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
      validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    end
  
    process(:store) do |io, context|
        original = io.download
        pipeline = ImageProcessing::MiniMagick.source(original)
        size_300 = pipeline.resize_to_limit!(200, 200)
        original.close!
        { original: io, thumb: size_300}
    end
end