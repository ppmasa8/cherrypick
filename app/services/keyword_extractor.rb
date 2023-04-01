require 'suika'

class KeywordExtractor
    def initialize
        @suika_tagger = Suika::Tagger.new
    end

    def extract_keywords(text)
        keywords = []
        @suika_tagger.parse(text).each { |word| keywords << word if word.include?("名詞") || word.include?("形容詞") }
        keywords
    end
end
