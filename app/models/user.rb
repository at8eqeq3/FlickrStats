class User
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field 'fullname', type: String
  field 'nickname', type: String
  field 'flickr_id', type: String
  field 'token', type: String
  field 'secret', type: String
  field 'userpic', type: String
  field 'flickr_url', type: String
  field 'is_admin', type: Boolean, default: false

  def self.create_with_omniauth(auth)
    create! do |user|
      user.flickr_id  = auth['uid']
      user.nickname   = auth['info']['name']
      user.fullname   = auth['info']['nickname']
      user.flickr_url = auth['info']['urls']['Profile']['_content']
      user.token      = auth['credentials']['token']
      user.secret     = auth['credentials']['secret']
      user.userpic    = auth['info']['image']
    end
  end
  def update_with_omniauth(auth)
    self.flickr_id  = auth['uid']
    self.nickname   = auth['info']['name']
    self.fullname   = auth['info']['nickname']
    self.flickr_url = auth['info']['urls']['Profile']['_content']
    self.token      = auth['credentials']['token']
    self.secret     = auth['credentials']['secret']
    self.userpic    = auth['info']['image']
  end

  #embeds_many :photos
  #embeds_many :user_metrics
  # XXX has_many :latest_metrics, -> {order("created_on DESC").limit(6)}, class_name: "UserMetric"
end
