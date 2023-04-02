require 'deepl'

class Translate
    def deepl_translate(text)
        begin
            DeepL.configure do |config|
                config.auth_key = ENV['DEEPL_AUTH_KEY']
                config.host = 'https://api-free.deepl.com'
            end

            translation = DeepL.translate(text, nil, 'EN')

            source_lang = translation.detected_source_language

            translated_text = translation.text

            return source_lang, translated_text
        rescue DeepL::Exceptions::RequestError => e
            puts 'Oops!'
            puts "Code: #{e.response.code}"
            puts "Response body: #{e.response.body}"
            puts "Request body: #{e.request.body}"
        end
    end
end