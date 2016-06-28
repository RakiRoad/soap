
#Description: Our team will write scripts to update the chemicals, facilities, and politicians for SOAP. This will be avaliable to the admin and will provide SOAP with the most up to date data.
#Filename: ScrapeTest.rb
#Description: This file is used to scrape the information for the website that supplies the politicians based on districts in New Jersey. The data collected is sent to a text file. -- It will be imporoved upon to parse the data and update the database for the second round of implementation.
#Last modified date: April 14, 2016

require 'nokogiri'
require 'open-uri'

$district_links = Array.new
$rep_info = Array.new

class Scrape_az
  URL = 'http://www.njleg.state.nj.us/districts/districtnumbers.asp'
  SEARCH_DISTRICTS_URL = "//a[contains(@href,'DistrictLegislators')]/@href"
  SEARCH_REP_INFO = "//img[contains(@src, 'member')]/@title"

  html = Nokogiri::HTML(open(URL))
  $district_links = html.xpath(SEARCH_DISTRICTS_URL).collect { |node| node.text.strip }

  $district_links.map! { |i| "http://www.njleg.state.nj.us/members/#{i}" }

  $district_links.each do |i|
    begin
      district = Nokogiri::HTML(open(i))
      temp_rep_info = district.xpath(SEARCH_REP_INFO).collect { |node| node.text.strip }
      $rep_info.insert(-1, temp_rep_info)
    end
  end

  test = File.open('testtestTEST.txt', 'w')

  $district_links.each do |i|
    begin
      test.write("#{i}\n")
    end
  end

  # $rep_links.each do |i|
  #   begin
  #     test.write("#{i}\n")
  #   end
  # end

  $rep_info.each do |i|
    begin
      test.write("#{i}\n")
    end
  end

  test.close()

end
