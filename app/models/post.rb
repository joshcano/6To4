class Post < ApplicationRecord
  has_many :transactions
  belongs_to :user
  accepts_nested_attributes_for :transactions, reject_if: :all_blank, allow_destroy: true
  has_attached_file :main_img, styles: { medium: "300x300>", thumb: "100x100>", small: '30x30>' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_img, content_type: /\Aimage\/.*\z/

  validates :goal, presence: true, numericality: true, format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
  validates :title, presence: true
  validates :body, presence: true

  def awarded
    transactions.pluck(:amount).inject(0) { |sum,x| sum + x }
  end
end
