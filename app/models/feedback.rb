class Feedback
  include Mongoid::Document
  field :message
  field :feedback_type
  field :name
  field :twitter_id
  field :created_at, :type => Date, :default => DateTime.new
  
  validates_length_of :message, :maximum => 140
  validates_presence_of :message, :feedback_type
  validates_inclusion_of :feedback_type, :in => ["good", "bad"]
  
  scope :good, where(:feedback_type => "good").desc(:created_at)
  scope :bad, where(:feedback_type => "bad").desc(:created_at)
end
