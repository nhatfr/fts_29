class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default_level

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :exams, dependent: :destroy

  enum level: [:normal, :admin]

  private
  def set_default_level
    self.level ||= :normal
  end
end
