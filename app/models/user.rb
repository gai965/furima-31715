class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'Include both letters and numbers'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :firstname
    validates :lastname
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :firstname_kana
    validates :lastname_kana
  end

  validates :nickname,       presence: true
  validates :lastname,       presence: true
  validates :firstname,      presence: true
  validates :lastname_kana,  presence: true
  validates :firstname_kana, presence: true
  validates :birth_date,     presence: true
end
