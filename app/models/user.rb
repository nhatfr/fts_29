class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :exams, dependent: :destroy
end
