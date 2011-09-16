module SemiStatic::Page::WithLocale
  def self.included(klass)
    klass.send :attr_accessor, :locale
    klass.extend ClassMethods
  end

  module ClassMethods
    def all
      super.find_all {|a| a.locale.to_sym == I18n.locale }
    end
  end
end
