# coding: utf-8
class Ask
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :body
  field :answered_at, :type => DateTime
  field :answers_count, :type => Integer, :default => 0
  field :comments_count, :type => Integer, :default => 0

  belongs_to :user, :inverse_of => :asks, :counter_cache => true

  embeds_many :comments
  has_many :topics, :store_as => :array

  has_many :answers

  attr_protected :user_id
  validates_presence_of :user_id, :title

  scope :last_actived, order_by("answered_at desc")


end