class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:validatable,
       :authentication_keys => [:name] 
       
  def email_required?
    false
  end
end
