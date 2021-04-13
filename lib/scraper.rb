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
    profile_page = Nokogiri::HTML(open(profile_url))

    individual_student = {}

    social_link = profile_page.css(".social-icon-container").css("a").map {|e| e.attributes"href").value}
    social_link.each do |link|
      if link.include?("linkedin")
        student[:linkedin] = link
      elsif link.indlue("twitter")
        student[:twitter] = link
      elsif link.include?("github")
        student[:github] = link
      else
        student[:blog] = link
      end
    end
      student[:bio] = profile_page.css(".description-holder").children.css("p").text
      student[:profile_quote] = profile_page.css(".profile-quote").children.text
      student
  end

end
