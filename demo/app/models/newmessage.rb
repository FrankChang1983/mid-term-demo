class Newmessage < ActiveRecord::Base
  validates_presence_of :topic, :content, :category_id
  has_many :comments, :dependent => :destroy
  belongs_to :user
  belongs_to :category
  delegate :name, :to => :category, :prefix => true, :allow_nil => true

end
