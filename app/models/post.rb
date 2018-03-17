class Post < ApplicationRecord
  has_many :transactions
  belongs_to :user

  accepts_nested_attributes_for :transactions, reject_if: :all_blank, allow_destroy: true

  def awarded
    transactions.pluck(:amount).inject(0) { |sum,x| sum + x }
  end
end
