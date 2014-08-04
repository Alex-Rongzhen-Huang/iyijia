# coding: utf-8
module CarrierWave
  module Uploader
    module Versions
      require 'rake'

      # 按照flickr的规则生成不同大小的缩略图，以更好的适配justified-gallery插件  http://miromannino.com/projects/justified-gallery/
      def full_filename(for_file)
        filename  = for_file.pathmap("%n")
        extension = for_file.pathmap("%x")
        [filename, version_name].compact.join('_') + extension
      end
    end
  end
end