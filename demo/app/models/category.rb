class Category < ActiveRecord::Base
  has_many :newmessages, :dependent => :destroy
end
