require 'suika'

class KeywordExtractor
    def initialize
        @suika_tagger = Suika::Tagger.new
    end

    def extract_keywords(text)
        keywords = []
        begin
            @suika_tagger.parse(text).each do |word|
                if word.include?("名詞") || word.include?("形容詞")
                    keywords << word.split("\t")[0] + " "
                end
            end
            return keywords
        rescue => exception
            puts "Oops!"
            puts "suika error: #{exception}"
        end
    end
end
