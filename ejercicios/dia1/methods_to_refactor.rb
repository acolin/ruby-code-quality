def calculate_radio_price(service_type)
  case service_type
    when 'car'
      response = get_car_calulations
    when 'van'
      response = get_van_calulations
    else
      response = get_scooter_calulations
    end
  return response
end

def store_city_and_state
  return unless latitude && longitude
  return unless latitude_changed? || longitude_changed?
  coder = Geocoder.search([latitude, longitude].join(','))
    if coder && coder.first
      begin
        update_column 'city', coder.first.city
        update_column 'state', coder.first.state
      rescue
        true
      end
    end
end

def find_or_invite_user
  self.user = User.find_by_email(email)
  
  unless self.user
    self.user = User.invite!(email: email, first_name: first_name, last_name: last_name) do |u|
      u.skip_invitation = true
    end
  end
end


def url
  raise Error.new(
    I18n.t('error.resource.id',  { resource: self.class.class_name, locale: :en }),
    I18n.t('error.resource.id_purchaser',  { locale: Conekta.locale.to_sym })) if (id.nil? || id.empty?)
    self.customer.url + self.class.url + "/" + id
end

def request(meth, url, params=nil)
  url = self.api_url(url)
  meth = meth.downcase
    
  begin
    conn = Faraday.new(
      :url => url,
      :ssl => { :ca_file=> File.dirname(__FILE__) + '/../ssl_data/ca_bundle.crt'}
    ) do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
        
    conn.headers['X-Conekta-Client-User-Agent'] = set_headers.to_json
    conn.headers['User-Agent'] = 'Conekta/v1 RubyBindings/' + Conekta::VERSION
    conn.headers['Accept'] = "application/vnd.conekta-v#{Conekta.api_version}+json"
    conn.headers['Accept-Language'] = Conekta.locale.to_s
    conn.headers['Authorization'] = "Basic #{ Base64.encode64("#{self.api_key}" + ':')}"
        
    if params
      conn.params = params
    end
      
    response = conn.method(meth).call
      
  rescue Exception => e
    Error.error_handler(e, "")
  end
      
  if response.status != 200
    Error.error_handler(JSON.parse(response.body), response.status)
  end
      
  return JSON.parse(response.body)
end