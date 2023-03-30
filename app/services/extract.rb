require 'suika'

class Extract
    def initialize
        @suika = Suika::Tagger.new
    end

    def extract(text)
        res = []
        @suika.parse(text).each{|s| res << s }
        res
    end
end