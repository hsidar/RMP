class RaccoonMailer < ApplicationMailer
  default from: "raccoon-metadata-project.herokuapp.com"
  
  def documentated(user)
    @raccoon = user.raccoons.last
    @user = user
    mail(to: @user.email, subject: 'You have documented a raccoon!')
  end
  
end
