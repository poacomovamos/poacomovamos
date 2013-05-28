require 'spec_helper'
require 'open-uri'

describe ProjectsInCourseScraper do
  
  describe '#process' do
    it "extracts project's information from HTML as a Ruby hash" do
      html = open('spec/models/projects_in_course_page.html')
      projects = subject.process html

      projects.should match_array([
        {number: "01634"},
        {number: "04078"},
        {number: "01978"},
        {number: "00674"}
      ])
    end
  end
end
