class BlogMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: "birotori@gmail.com", subject: "お問い合わせの確認メール"
  end
end
