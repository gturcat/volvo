class PartnerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.partner_mailer.confirm.subject
  #
  def confirm(mail, factory_order, partner)
    @factory_order = factory_order
    @email = mail
    @partner = partner
    mail(
      to:      @email,
      subject:  "Confirmation de votre commande"
    )
  end
end
