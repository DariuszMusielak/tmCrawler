class Map < ActiveRecord::Base
  attr_accessible :content, :name, :url, :status

  validates :name, presence: true
  validates :url, presence: true
  validates :status, presence: true

  belongs_to :user

  scope :status_sent, -> { where(status: "wyslany") }
  scope :status_created, -> { where(status: "utworzony") }
  scope :status_done, -> { where(status: "wykonany") }

end
