# encoding: UTF-8

class SemiStatic::News < SemiStatic::Page
  attr_accessor :published_at
  delegate :year, :month, :day, :to => :published_at

  def self.all
    super.sort_by(&:published_at).reverse
  end

  # used for atom feed
  def id
    Digest::MD5.hexdigest to_param
  end

  def to_param
    "#{year}/#{month}/#{day}/#{super}"
  end
end
