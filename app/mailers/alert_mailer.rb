class AlertMailer < ApplicationMailer
  default from: Settings.mailer_from

  def alert_exam exam
    @exam = exam
    mail to: exam.user.email
  end
end
