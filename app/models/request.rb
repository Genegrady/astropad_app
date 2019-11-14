class Request < ApplicationRecord
    belongs_to :requester, class_name: 'Padder', foreign_key: :requester_padder_id, dependent: :destroy
    belongs_to :requestee, class_name: 'Padder', foreign_key: :requestee_padder_id, dependent: :destroy
    # has_many :padders
end
