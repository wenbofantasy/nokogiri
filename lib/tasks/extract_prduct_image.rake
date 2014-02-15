require 'open-uri'

desc "extract product image from jd>com"
task :extract_image => :environment do 
  c= Computer.all 
  c.each do |computer|
    file_path = File.join(Rails.root, "public", "tmp.jpg")
    data = open(computer.image_url) do |f| 
      f.read
    end
    File.open(file_path, "wb"){|f| f.write(data)}
    p= File.open(file_path)
    computer.avatar = p
    computer.save
    #p.save
  end
end



#require 'open-uri'
#desc "extract product image from jd>com"
#task :extract_image => :environment do 
  #c= Computer.all 
    #i = 0
  #c.each do |computer|
    #file_path = File.join(Rails.root, "public", "example#{i}.jpg")
    #i = i + 1
    #data = open(computer.image_url) do |f| 
      #f.read
    #end
    #File.open(file_path, "wb"){|f| f.write(data)}
    ##File.open(file_path, "wb") do |saved|
      ##open(computer.image_url, 'rb') do |read_file|
        ##saved.write(read_file.read)
      ##end
    ##end
    ##p= File.open(file_path)
    ##computer.avatar = p
    ##computer.save
    ##p.save
  #end
#end
