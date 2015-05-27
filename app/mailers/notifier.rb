class Notifier < ApplicationMailer
  default from: "no-reply@example.com",
          return_path: "system@example.com"
  
  def welcome
    mail to: "tran.van.nhat@framgia.com" do |format|
      format.text
    end
  end

  def insert_url user
    @account = user
    mail to: "tran.van.nhat@framgia.com" do |format|
      format.text
    end
  end

  def send_alert question
    @question = question
    mail to: "tran.van.nhat@framgia.com" do |format|
      format.text
    end
  end
end
