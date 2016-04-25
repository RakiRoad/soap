require 'nokogiri'
require 'open-uri'

$district_links = Array.new
$rep_info = [[]]

class Scrape_az
  URL = 'http://www.njleg.state.nj.us/districts/districtnumbers.asp'
  DISTRICTS_URL = "//a[contains(@href,'DistrictLegislators')]/@href"
  DISTRICT_NUM = "//td[contains(@colspan, '3') and contains(@align, 'left')]//text()"  
  REP_INFO = "//td[contains(@align, 'center') and contains(@valign, 'top')]//b//text()"

  html = Nokogiri::HTML(open(URL))
  $district_links = html.xpath(DISTRICTS_URL).collect { |node| node.text.strip }

  $district_links.map! { |i| "http://www.njleg.state.nj.us/members/#{i}" }

  $district_links.each do |i|
    begin
      district = Nokogiri::HTML(open(i))
      
      temp_rep_info = district.xpath(REP_INFO).collect { |node| node.text.strip }
      temp_rep_info.each_slice(3) do | party, position, name |
        temp_data = [4]
        temp_data[0] = district.xpath(DISTRICT_NUM).text.strip

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

  # Switch
  #politicians = File.open('politicians.sql', 'w')
  politicians = File.open('politicians.txt', 'w')

  $rep_info.each do |i|
    begin
      # Will generate SQL insert into commands for each person
      # string = "INSERT INTO table (District, Party, Position, Name) VALUES ('#{i[0]}', '#{i[1]}', '#{i[2]}', '#{i[3]}');"
      # politicians.write(string)
      politicians.write("#{i}\n")
    end
  end
  politicians.close()
end
