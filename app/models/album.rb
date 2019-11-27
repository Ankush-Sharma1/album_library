class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :title, presence: true,
            :format => { :with => /\A[a-zA-Z0-9 ]+\z/i,
            :message => "Only Alpha Numeric allowed" }, :length => { :in => 6..20 }
end
