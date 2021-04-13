require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))

    students = []

    # page.css("div.roster-cards-container").each do |card|
      index_page.css("div.student-card").each do |student|     #"div.student-card" obtained from website

        students << {
          :name => student.css('.student-name').text,
          :location => student.css('.student-location').text,
          :profile_url => student.css("a").attr('href').value
        }
      end
    students
  end


  def self.scrape_profile_page(profile_url)

  end

end
