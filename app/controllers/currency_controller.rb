class CurrencyController < ApplicationController

  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_keys = @symbols_hash.keys

    @array_of_symbols = Array.new

    render({:template => "currency_views/step_one.html.erb"})
  end
  
  def second_currency
    @from_currency = params.fetch("from_currency")
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_keys = @symbols_hash.keys
   
    render({:template => "currency_views/step_two.html.erb"})
  end  

    def third_currency
    @from_currency = params.fetch("from_currency")
    @to_currency = params.fetch("to_currency")
    @raw_data = open("https://api.exchangerate.host/convert?from=" + @from_currency + "&to=" + @to_currency ).read
    @parsed_data = JSON.parse(@raw_data)
    @result_key = @parsed_data.fetch("result")
    # @array_of_keys = @parsed_data.keys
   
    render({:template => "currency_views/step_three.html.erb"})
  end  
end