class Item

  attr_reader :rank, :title, :score, :comments_number

  def initialize(args)
    @rank                = parse_to_integer(args.fetch(:rank, ''))
    @title               = args.fetch(:title, '')
    @score               = parse_to_integer(args.fetch(:score, 0))
    @comments_number     = parse_to_integer(args.fetch(:comments_number, 0))
  end

  def title_words_count
    @title.split(' ').count
  end

  def to_s
    "##{@rank} - #{@title} - score : #{@score} - comments : #{@comments_number}"
  end

  private

  def parse_to_integer(val)
    val.to_i
  end
end
