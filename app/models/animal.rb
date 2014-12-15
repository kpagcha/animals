class Animal < ActiveRecord::Base
	belongs_to :kingdom

	validates :common_name, presence: true
	validates :subspecie, presence: true
end
