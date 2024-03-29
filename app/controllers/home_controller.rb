require 'keyword_extractor'
require 'translate'

class HomeController < ApplicationController
    before_action :set_result, only: [:index]
    before_action :set_text, only: [:new]

    def index
    end

    def new
        if @text == "" || @text.nil?
            flash[:alert] = "Please input text."
            render("home/index") and return
        end

        flash[:notice] = "Text was successfully updated."
        redirect_to action: 'index', text: @text
    end

    private

    def home_params
        params.permit(:text)
    end

    def set_text
        @text = home_params[:text]
    end

    def set_result
        return if home_params[:text].nil? || home_params[:text] == ""

        keywords = extract_keywords_from_text(home_params[:text])
        @result = Translate.new.deepl_translate(keywords.join)[1]
        flash[:notice] = 'Text was successfully updated.'
    end

    def extract_keywords_from_text(text)
        response = KeywordExtractor.new.post(text)
        KeywordExtractor.new.extract_keywords_from_response(response)
    end
end