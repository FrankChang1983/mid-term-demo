class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :newmessages, :dependent => :destroy

end
