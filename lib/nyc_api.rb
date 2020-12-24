require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
 
class GetPrograms
  #constant to store API endpoint
  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri) #sends HTTP GET request
    response.body
  end

  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(self.get_programs)
      binding.pry
      programs.collect do |program|
        program["agency"]  
      end
  end 

end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq 
