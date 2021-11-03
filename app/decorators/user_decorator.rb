class UserDecorator < ApplicationDecorator
  delegate_all

  def name_or_email
    return name.capitalize if name.present?
    email.split('@')[0].capitalize
  end

  def show_avatar(css_class: '')
    h.image_tag self.avatar.url(:thumb), class: "rounded #{css_class}", alt: name_or_email
  end

end
