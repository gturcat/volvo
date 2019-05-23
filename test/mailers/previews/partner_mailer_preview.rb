# Preview all emails at http://localhost:3000/rails/mailers/partner_mailer
class PartnerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/confirm
  def confirm
    @factory_order = FactoryOrder.last
    PartnerMailer.confirm(@factory_order)
  end

end
