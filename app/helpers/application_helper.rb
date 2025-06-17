module ApplicationHelper
  def username(email)
    email.split('@').first.capitalize
  end
end
