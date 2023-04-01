require 'suika'

class KeywordExtractor
    def initialize
        @suika_tagger = Suika::Tagger.new
    end

    def extract_keywords(text)
        keywords = []
        @suika_tagger.parse(text).each { |word| keywords << word }
        keywords
    end
end
