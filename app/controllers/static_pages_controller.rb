class StaticPagesController < ApplicationController
  def home
  end

  def about
    @items = [ "Javascript", "C#", "Mandarin", "Java", 
               "Fujian", "Duke University", "Ruby on Rails", "Chinese"
               ]
  end

  def contact
  end

  def projects
    
  end
end
