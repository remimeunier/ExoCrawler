class ItemList

  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def filter_1
    items.select{ |item| item.title_words_count > 5 }.sort_by{ |item| -item.comments_number }
  end

  def filter_2
    items.select{ |item| item.title_words_count < 6 }.sort_by{ |item| -item.score }
  end

  def to_s
    items.each do |item|
      item
    end
  end
end
