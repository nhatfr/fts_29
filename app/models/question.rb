class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  
  accepts_nested_attributes_for :answers, allow_destroy: true,
                                 reject_if: :all_blank

  scope :random_questions, ->number{limit(number).sort_by{rand}} 
end
