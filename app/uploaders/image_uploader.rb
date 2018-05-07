require "image_processing/mini_magick"


class ImageUploader < Shrine
    # plugins and uploading logic
    plugin :processing
    plugin :versions, name: [:original, :thumb, :medium]   # enable Shrine to handle a hash of files
    plugin :delete_raw # delete processed files after uploading
    plugin :validation_helpers


    process(:store) do |io, context|
        original = io.download
        pipeline = ImageProcessing::MiniMagick.source(original)
        size_80 = pipeline.resize_to_limit!(80, 80)
        size_300 = pipeline.resize_to_limit!(300, 300)
        original.close!
        #return hash of 3 types of the same image
        { original: io, thumb: size_80, medium: size_300 }
    end


    Attacher.validate do
        validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
        validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    end


end