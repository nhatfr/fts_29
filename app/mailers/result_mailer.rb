class ResultMailer < ApplicationMailer
  default from: Settings.mailer_from

  def result_exam exam
    @exam = exam
    mail to: exam.user.email
  end
end
