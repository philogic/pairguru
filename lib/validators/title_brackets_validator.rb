class TitleBracketsValidator < ActiveModel::Validator
  attr_accessor :title

  def validate(record)
    if !matched_brackets?(record.title) || !empty_brackets?(record.title)
      record.errors[:title] << 'Brackets must be matched and cannot be empty!'
    end
  end

  private

  def matched_brackets?(string)
    matcher = []
    pairs = { '(' => ')', '[' => ']', '{' => '}' }
    opening = pairs.keys
    closing = pairs.values

    string.each_char do |char|
      if opening.include? char
        matcher << char
      elsif closing.include? char
        return false if matcher.empty? || pairs[matcher.pop] != char
      end
    end
    matcher.empty?
  end

  def empty_brackets?(string)
    empty_brackets = [ '()', '[]', '{}' ]
    empty_brackets.none?(&string.method(:include?))
  end
end