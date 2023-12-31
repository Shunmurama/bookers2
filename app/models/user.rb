class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :profile_image
  has_many :books, dependent: :destroy

  validates :name, length: {minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: {maximum: 50 }




    def change
      add_index :user, :name, unique: true
    end


end
