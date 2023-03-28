class HomeController < ApplicationController
    def index
        @text = params[:text]
    end

    def post
        render("home/index") and return if params[:text].nil?

        @text = params[:text]
        redirect_to action: 'index', text: @text
    end
end