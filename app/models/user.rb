class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :email
  has_and_belongs_to_many :gift_exchanges,
                          join_table: :gift_exchange_users,
                          foreign_key: :participant_id,
                          association_foreign_key: :gift_exchange_id
  
end
