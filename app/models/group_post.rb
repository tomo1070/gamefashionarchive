class GroupPost < ApplicationRecord
  belongs_to :post
  belongs_to :group
end
