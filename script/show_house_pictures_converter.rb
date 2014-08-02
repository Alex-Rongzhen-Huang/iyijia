# encoding: utf-8
#!/usr/bin/env ruby.exe
require 'find'
require 'mini_magick'

def is_landscape? (picture_path)
  image = MiniMagick::Image.open(picture_path)
  result = image[:width] > image[:height]
  puts "is_landscape? #{result} - #{image[:width]}, #{image[:height]}"
  result
end

# resize with min-width 431, which leads to height > 431
# 竖屏
def resize_width_to_431 (img)
  puts "call resize_width_to_431"
  img.resize("431")

  puts "NOW - #{img[:width]}, #{img[:height]}"

  top = (img[:height]-431)/2
  left = 0

  puts "size[#{img[:width]}x#{img[:height]}] -> crop to 431x431+#{left}+#{top}"
  img.crop("431x431+#{left}+#{top}")


  img
end

# resize with min-height 431, which leads to width > 431
# 横屏
def resize_height_to_431 (img)
  puts "call resize_height_to_431"

  img.resize("x431")

  puts "NOW - #{img[:width]}, #{img[:height]}"

  top = 0
  left = (img[:width]-431)/2

  puts "size[#{img[:width]}x#{img[:height]}] -> crop to 431x431+#{left}+#{top}"
  img.crop("431x431+#{left}+#{top}")

  img
end

def resize_to_fit_100(img)
  img.resize("100x100")
  img
end

def print_usage
  puts "-----------Usage---------"
  puts "> ruby script/show_house_pictures_converter.rb <show_house_pictures_dir>"
  puts ""
end

if ARGV.length != 1
  print_usage
  exit
else

  show_house_pictures_dir = ARGV[0]
  Find.find("#{show_house_pictures_dir}") do |f|

    puts "#{f} ...."
    if File.exist? f

      dirname = File.dirname(f)
      extname = File.extname(f)
      basename = File.basename(f,extname)
      if extname =~ /(jpg|jpeg|gif|png)/
        img = MiniMagick::Image.open f
        if is_landscape? f
          img = resize_height_to_431(img)
        else
          img = resize_width_to_431(img)
        end

        write_path = "#{dirname}/#{basename}_nine#{extname}"
        if File.exist?(write_path)
          puts "file exist #{write_path}"
        else
          puts "write to #{write_path}"
          img.write(write_path)
        end

        img = resize_to_fit_100(img)
        write_path = "#{dirname}/#{basename}_t#{extname}"
        if File.exist?(write_path)
          puts "file exist #{write_path}"
        else
          puts "write to #{write_path}"
          img.write(write_path)
        end
      end
    end
  end
end

#
#img = MiniMagick::Image.from_file args[0]
#
##取得宽度和高度
#
#w, h = img[:width], img[:height] #=> [2048, 1536]
#
#shaved_off = ((w-h)/2).round #=> 256
#
##此处表示宽度上左右各截取256个像素，高度上截取0像素
#img.shave "#{shaved_off}x0″
#
#
#
#img.write " 2.jpg "