require 'keyword_extractor'

class HomeController < ApplicationController
    before_action :set_result, only: [:index]
    before_action :set_text, only: [:new]

    def index
    end

    def new
        if @text == ""
            flash[:alert] = "Please input text."
            render("home/index") and return
        end

        flash[:notice] = "Text was successfully updated."
        redirect_to action: 'index', text: @text
    end

    private

    def set_text
        @text = home_params[:text]
    end

    def set_result
        return if home_params[:text] == ""
        @result = extract_keywords_from_text(home_params[:text])
    end

    def home_params
        params.permit(:text)
    end

    def extract_keywords_from_text(text)
        KeywordExtractor.new.extract_keywords(text)
    end
end