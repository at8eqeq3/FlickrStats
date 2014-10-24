class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field 'title', type: String
  field 'flickr_id', type: String
  field 'secret', type: String
  field 'server', type: String
  field 'farm', type: String
  field 'page_url', type: String

  def self.create_with_flickraw_u(data)
    create! do |photo|
      photo.title     = data.title
      photo.flickr_id = data.id
      photo.secret    = data.secret
    end
  end
  def update_with_flickraw_u(data)
    self.title     = data.title
    self.flickr_id = data.id
    self.secret    = data.secret
  end
  def update_with_flickraw_p(data)
    self.title     = data.title
    self.flickr_id = data.id
    self.secret    = data.secret
    self.server    = data.server
    self.farm      = data.farm
    add = false
    if self.metrics.count > 0
      if self.metrics.last.c_at.to_date < Date.today
        add = true
      end
    else
      add = true
    end
    self.metrics << Metric.new(value: data.views) if add
    self.page_url = FlickRaw.url_short(data)
    self.save
  end

  embedded_in :user
end
