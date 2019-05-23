class PartnerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.partner_mailer.confirm.subject
  #
  def confirm(mail)
    @email = mail
    mail(
      to:      @email,
      subject:  "Confirmation of your factory order"
    )
  end
end
