class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
            length:  {minimum: 2 , maximum: 20 }

  validates :introduction,
            length:  {maximum: 50 }

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  #登録時にメールアドレスを不要とする
  # def email_required?
  #   false
  # end

  def email_changed?
    false
  end



  has_many :books, dependent: :destroy
         attachment :profile_image
end
