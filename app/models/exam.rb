class Exam < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy

  before_create :create_default_status
  after_create :create_results
  before_update :marking, if: :testing?

  accepts_nested_attributes_for :results, allow_destroy: true

  scope :order_created, ->{order created_at: :desc}

  enum status: [:created, :testing, :completed]

  def time_up?
    execute_time >= max_time
  end

  def update_start_time time
    update_attributes start_at: time
  end

  def update_status status
    update_attributes status: status
  end

  def time_countdown
    max_time - execute_time
  end
  
  private
  def marking   
    mark = results.select do |result|
      result.answer.correct? unless result.answer.nil?
    end.count
    self.mark = "#{mark.to_s}/#{category.max_question}"
  end

  def create_default_status
    self.status = :created
  end

  def create_results
    @questions = category.questions.random_questions category.max_question
    @questions.each {|question| results.create question: question}
  end

  def execute_time
    (Time.zone.now - self.start_at).to_i
  end

  def max_time
    self.category.max_time * 60
  end
end
