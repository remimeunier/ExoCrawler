require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'item'
require_relative 'item_list'

url = "https://news.ycombinator.com/"
doc = Nokogiri::HTML(open(url))
item_list = ItemList.new
doc.css(".itemlist").css("tr.athing").each do |item|
  rank = item.at_css('.rank').text[/[0-9]+/]
  title = item.css('.title')[1].at_css('a').text
  score = item.next.at_css('.score') ? item.next.at_css('.score').text[/[0-9]+/] : 0
  comments_number = item.next.css('.subtext').children.css('a').last.text[/[0-9]+/]
  item_list.add(Item.new(rank: rank, title: title, score: score, comments_number: comments_number))
end

puts "THE FULL LIST : "
puts ''
puts item_list.to_s
puts ''
puts ' ----------------------- '
puts 'Filter 1'
puts ''
puts item_list.filter_1
puts ''
puts ' ----------------------- '
puts 'Filter 2'
puts ''
puts item_list.filter_2
