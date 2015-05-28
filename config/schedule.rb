every 1.minutes do
  runner "Exam.send_alert_mail"
end

every :day do
  runner "Exam.delete_fake_exam"
end
