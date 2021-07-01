class GamesController < ApplicationController
  def new
    charset = Array('a'..'z')
    @letters = Array.new(10) { charset.sample }
  end

  def score
    @final_results = {}
    @letters2 = params[:board].split('')
    url = 'https://wagon-dictionary.herokuapp.com/' + params[:word]
    word_check = URI.open(url).read
    results = JSON.parse(word_check)

    chars = params[:word].split('')
     chars.each do |char| if @letters2.include?(char)
     @final_results[:message] = results["found"] ? "Well Done!" : "not an english word"
    else
    @final_results[:message] = "Not in the grid"
    end
  end
  end
end
