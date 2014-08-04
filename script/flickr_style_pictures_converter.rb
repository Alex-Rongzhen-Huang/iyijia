# encoding: utf-8
#!/usr/bin/env ruby.exe
require 'find'
require 'mini_magick'

# flickr的缩略图规则
#"_t": thumbnail, 100px on longest side
#"_m": small, 240px on longest side
#"_n": small, 320px on longest side
#"" : medium, 500px on longest side
#"_z": medium 640, 640px on longest side
#"_c": medium 800, 800px on longest side
#"_b": large, 1024px on longest side

def resize_to(img, size, write_path)
  img.resize("#{size}x#{size}")
  if File.exist?(write_path)
	  puts "file exist #{write_path}"
  else
	 puts "write to #{write_path}"
	 img.write(write_path)
  end		
  img
end

def print_usage
  puts "-----------Usage---------"
  puts "> ruby script/flickr_style_pictures_converter.rb <decorate_schema_pictures_dir>"
  puts ""
end

if ARGV.length != 1
  print_usage
  exit
else

  decorate_schema_pictures_dir = ARGV[0]
  Find.find("#{decorate_schema_pictures_dir}") do |f|

    puts "#{f} ...."
    if File.exist? f

      dirname = File.dirname(f)
      extname = File.extname(f)
      basename = File.basename(f,extname)
      if extname =~ /(jpg|jpeg|gif|png|JPG|JPEG|GIF|PNG)/
        img = MiniMagick::Image.open f
		
        write_path = "#{dirname}/#{basename}_b#{extname}"
		img = resize_to(img,1024,write_path);

        write_path = "#{dirname}/#{basename}_c#{extname}"
		img = resize_to(img,800,write_path);
		
		write_path = "#{dirname}/#{basename}_z#{extname}"
		img = resize_to(img,640,write_path);
		
		write_path = "#{dirname}/#{basename}__#{extname}"
		img = resize_to(img,500,write_path);
		
		write_path = "#{dirname}/#{basename}_n#{extname}"
		img = resize_to(img,320,write_path);
		
		write_path = "#{dirname}/#{basename}_m#{extname}"
		img = resize_to(img,240,write_path);
		
		write_path = "#{dirname}/#{basename}_t#{extname}"
		img = resize_to(img,100,write_path);
		
      end
    end
  end
end
