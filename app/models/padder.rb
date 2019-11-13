class Padder < ApplicationRecord
    has_secure_password
    
    validates :username, presence: true, uniqueness: true
    
    belongs_to :location
    
    has_many :requesting_padders, foreign_key: :requester_padder_id, class_name: 'Request', dependent: :destroy
    
    has_many :requestees, through: :requesting_padders, source: :requestee

    has_many :requested_padders, foreign_key: :requestee_padder_id, class_name: 'Request', dependent: :destroy
    has_many :requesters, through: :requested_padders, source: :requester
    # has_many :requests
end
