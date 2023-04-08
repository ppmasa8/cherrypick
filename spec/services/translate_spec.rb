require 'rails_helper'

RSpec.describe Translate do
    describe '#deepl_translate' do
        it 'returns the translated text' do
            text = '私は言語AIで、あなたの質問に答えることができます。'
            source_lang, translated_text = Translate.new.deepl_translate(text)
            expect(translated_text).to eq('I am a language AI and can answer your questions.')
        end

        it 'returns the chopped up translated text' do
            text = '空、自由、タケコプター、寒い、広い'
            source_lang, translated_text = Translate.new.deepl_translate(text)
            expect(translated_text).to eq('Sky, freedom, bamboo shoots, cold, wide')
        end

        it 'when the text is empty, returns the empty string' do
            text = ''
            source_lang, translated_text = Translate.new.deepl_translate(text)
            expect(translated_text).to eq('')
        end
    end
end