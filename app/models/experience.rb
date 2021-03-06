class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :concert
  
    accepts_nested_attributes_for :concert

    validates :rating, presence: true
    validates :content, presence: true
    

    validates :concert, uniqueness: { scope: :user, message: "already has an experience" }
    
    scope :order_by_rating, -> {joins(:experiences).group(:id).order('avg(rating) desc')}

    def self.concert_rating
      order(rating: :desc)
    end    
  
  end
