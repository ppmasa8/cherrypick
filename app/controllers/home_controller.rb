require 'extract'

class HomeController < ApplicationController
    before_action :set_text, only: [:index, :new]

    def index
    end

    def new
        if @text.nil?
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

    def home_params
        params.permit(:text)
    end
end