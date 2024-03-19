# lib/tasks/sample_data.rake
namespace :db do
  desc "Generate sample data for Officials, Stocks, Users, and Trades"
  task generate_sample_data: :environment do
    require 'faker'

    # Clear existing data
    Trade.delete_all
    User.delete_all
    Official.delete_all
    Stock.delete_all

    # Custom method for generating a fake stock name
    def fake_stock_name
      "#{Faker::Company.unique.name} #{['Inc', 'Corp', 'Group', 'LLC'].sample}"
    end

    puts "Old sample data cleared."

    # Generate 10 Officials
    10.times do
      Official.create(name: Faker::Name.name)
    end

    # Reset Faker's unique generator to avoid running out of unique values
    Faker::UniqueGenerator.clear

    # Generate 10 Stocks
    10.times do
      Stock.create(name: Faker::Company.unique.name)
    end

    # Generate 10 Users
    10.times do
      User.create(
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 10, max_length: 20),
        name: Faker::Name.name
      )
    end

    # Generate 10 Trades
    10.times do
      Trade.create(
        official_id: Official.order('RANDOM()').first.id,
        stock_id: Stock.order('RANDOM()').first.id,
        user_id: User.order('RANDOM()').first.id,
        transaction_type: ['buy', 'sell'].sample,
        transaction_count: Faker::Number.between(from: 1, to: 100),
        security_type: ['Equity', 'Bond', 'ETF'].sample,
        name: fake_stock_name
      )
    end

    puts "Sample data generated successfully!"
  end
end
