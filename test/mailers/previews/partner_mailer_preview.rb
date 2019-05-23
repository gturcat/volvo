# Preview all emails at http://localhost:3000/rails/mailers/partner_mailer
class PartnerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/confirm
  def confirm
    @factory_order = FactoryOrder.last
    @employee = EmployeePartner.last
    @employee_mail = @employee.email
    @partner = Partner.last
    PartnerMailer.confirm(@employee_mail, @factory_order, @partner)
  end

end
