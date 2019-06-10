require 'open-uri'
require 'json'
require 'date'

def currency_conversion (amount, currency)
    url = "http://data.fixer.io/api/2018-03-19?access_key=0e024f9c862ff784702ae70daad8ecb4&base=eur"
    response = open(url).read
    response = JSON.parse(response)
    converted_rate = amount / response['rates'][currency] 
    p converted_rate    
end 

def deal_converter (deal)
    amount = deal.amount
    currency = deal.currency
    currency_conversion(amount,currency)
end

def time_conversion (starting_date, ending_date)
    duration = []
    duration << Date.parse(starting_date)
    duration << Date.parse (ending_date)
    return duration 
end

def total_revenue (deals, starting_date, ending_date)
    starting_date = time_conversion(starting_date)
    ending_date = time_conversion(ending_date)
    valid_deals = []
    revenue = []

    deals.each do |deal|
        if deal.starting_date >= starting_date && deal.starting_date <= ending_date
            valid_deals << deal
        end 
    end

    valid_deals.each do |deal|
        revenue << deal_converter(deal)
    end

    revenue.reduce(:+)
end


