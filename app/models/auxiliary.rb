class Auxiliary < ActiveRecord::Base
  validates :email, uniqueness: true
end
