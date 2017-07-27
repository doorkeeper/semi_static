# encoding: UTF-8
class Faq < SemiStatic::Page
  def self.find(param)
    all.find {|a| a.to_param.match(/^#{Regexp.escape(param)}/)}
  end
end
