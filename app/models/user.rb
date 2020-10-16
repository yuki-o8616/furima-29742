class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :nickname, presence: true
         validates :famil_name,fomat: { with:/\A[ぁ-んァ-ン一-龥]+\z/ } do 
         validates :first_name,fomat: { with:/\A[ぁ-んァ-ン一-龥]+\z/ } do
         validates :famil_name_kana,fomat: { /\A[ァ-ヶー－]+\z/ } do
         validates :first_name_kana,fomat: { /\A[ァ-ヶー－]+\z/ } do
         validates :password,fomat: { /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :birth_day,fomat: { /\A[a-zA-Z0-9]+\z/	} do
         
 end
