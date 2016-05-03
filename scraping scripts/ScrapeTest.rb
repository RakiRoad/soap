require 'nokogiri'
require 'open-uri'

$district_links = Array.new
$rep_info = [[]]
$img_links = []

class Scrape_az
  URL = 'http://www.njleg.state.nj.us/districts/districtnumbers.asp'
  DISTRICTS_URL = "//a[contains(@href,'DistrictLegislators')]/@href"
  DISTRICT_NUM = "//td[contains(@colspan, '3') and contains(@align, 'left')]//text()"  
  REP_INFO = "//td[contains(@align, 'center') and contains(@valign, 'top')]//b//text()"
  IMG_LINK = "//img/@src"

  html = Nokogiri::HTML(open(URL))
  $district_links = html.xpath(DISTRICTS_URL).collect { |node| node.text.strip }

  $district_links.map! { |i| "http://www.njleg.state.nj.us/members/#{i}" }

  $district_links.each do |i|
    begin
      district = Nokogiri::HTML(open(i))
      
      district.xpath(IMG_LINK).each do |url|
        $img_links.push("http://www.njleg.state.nj.us/members/#{url}")
      end

      temp_rep_info = district.xpath(REP_INFO).collect { |node| node.text.strip }
      temp_rep_info.each_slice(3) do | party, position, name |
        temp_data = [5]
        temp_data[0] = district.xpath(DISTRICT_NUM).text.strip
        temp_data[0].gsub!('District', '').strip

        if party.include? "D"
          temp_data[1] = "Democrat"
        else
          temp_data[1] = "Republican"
        end
        temp_data[2] = position
        temp_data[3] = name
        
        $rep_info.push(temp_data)
      end
    end
  end

  politicians = File.open('updatesoap2.sql', 'a+')
  politicians.write("\n")
  politicians.write("DELETE FROM newsoap.politicians;\n")
  politicians.write("COPY newsoap.politicians (name, party, state_name, distric_no, image_link) FROM stdin;")
  $image_counter = 0
  $rep_info.each do |i|
    begin
      politicians.write("#{i[3]} #{i[1]} New Jersey #{i[0]} #{i[3]} #{$img_links[$image_counter]}\n")
      $image_counter = $image_counter + 1
    end
  end

  politicians.write("\\.")
  politicians.close()
end
