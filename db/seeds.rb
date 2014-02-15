#encoding: utf-8
require "open-uri"
require "nokogiri"
require "mysql2"


@file=open("jd.txt","w")
def jingdong(url)
  s = 0
  data=open(url){|f| f.read}
  doc=Nokogiri::HTML(data)
  doc.css('ul.list-h li').each{|p|
@computer = Computer.new
    name=p.css('div.p-name').text
    product_url=p.css('div.p-name')[0].children[0]["href"]
    @file.puts("#{name}\n")
    @file.puts("#{product_url}\n")

    img=p.css('div.p-img img').each{|img|
      img_url= p.css('div.p-img img')[0]["src"]
      if img_url.nil?
        img_url = p.css('div.p-img img')[0]["data-lazyload"]
      end
      #imgAddr=img.attr('src') 
      @file.puts("#{img_url}\n")
      time=Time.now
      #sql="INSERT INTO qiushibaike (`body`,`img`,`time`) VALUES ('#{content}','#{imgAddr}','#{time}')"
      s += 1
      print "page:       ", s , "\n"
      print "name：      ", name, "\n"
      print "product_url ", product_url, "\n"
      print "image_url:  ", img_url, "\n"
      puts
      @computer.name = name
      @computer.product_url = product_url
      @computer.image_url = img_url
      @computer.save
    }
  }
end
for i in 1..20
  @file.puts("这是第#{i}页")
  #url="http://www.qiushibaike.com/8hr/page/#{i}"
  url="http://list.jd.com/670-671-672-0-0-0-0-0-0-0-1-1-#{i}-1-1-72-4137-0.html"
  puts  jingdong(url)
  puts "这是第#{i}页"
end

