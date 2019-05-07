class QuotesController < ApplicationController
 
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

def create
  @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Come on, dude.</strong> Quotes between 3 & 140 characters & author\'s name between 3 & 50 characters.'
    end  
  redirect_to root_path
end

private

def quote_params
  params.require(:quote).permit(:saying, :author)
end

end