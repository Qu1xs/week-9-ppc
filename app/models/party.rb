class Party < ApplicationRecord
  has_many :parties_supplies
  has_many :supplies, through: :parties_supplies
  belongs_to :category, dependent: :destroy

    def private?
        self.private ? 'Private' : 'Public'
    end

    def category_attributes=(attr)
      self.category= Category.find_or_create_by(attr) if attr[:name].present?
    end

end
