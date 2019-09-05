class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :items, dependent: :destroy
  has_many :votes_items, dependent: :destroy
  has_many :votes_item_items, through: :votes, source: :item
  has_many :buyed_item, foreign_key: "buyers_id", class_name: "Item"
  has_many :selling_item, -> {where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_item, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :user_ratings
  has_many :cards
  has_many :item_comments
  has_one :address

  has_many :sns_credentials, dependent: :destroy
  
  
  
  validates :nickname, presence: true
  validates :first_name, presence: true, length: {maximum: 20}
  validates :last_name, presence: true, length: {maximum: 20}
  validates :first_name_kana, presence: true, length: {maximum: 20}
  validates :last_name_kana, presence: true, length: {maximum: 20}
  validates :birthday, presence: true

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認 
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else 
      user = User.where(email: auth.info.email).first
      if user.present? 
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user , sns_id: sns.id }
  end

end
