# == Schema Information
#
# Table name: trades
#
#  id                :integer          not null, primary key
#  name              :string
#  security_type     :string
#  transaction_count :integer
#  transaction_type  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  official_id       :integer          not null
#  stock_id          :integer          not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_trades_on_official_id  (official_id)
#  index_trades_on_stock_id     (stock_id)
#  index_trades_on_user_id      (user_id)
#
# Foreign Keys
#
#  official_id  (official_id => officials.id)
#  stock_id     (stock_id => stocks.id)
#  user_id      (user_id => users.id)
#
class Trade < ApplicationRecord
  belongs_to :official
  belongs_to :stock
  belongs_to :user
end
