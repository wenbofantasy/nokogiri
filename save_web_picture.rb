require "open-uri"
file_path = "/home/bob/"
url = "https://www.google.com.hk/images/srpr/logo11w.png"
data = open(url) do |f| f.read end
File.open(file_path,'wb'){ |f| f.write(data);f.close }

