class BackgroundResults 

  def format_response(location)
    keyword = format_keyword(location)
    results = image_service(keyword)
    {
      background_images: {
        background1_url: results[:results][0][:urls][:full],
        background1_description: results[:results][0][:alt_description],
        background2_url: results[:results][1][:urls][:full],
        background2_description: results[:results][1][:alt_description],
        background3_url: results[:results][2][:urls][:full],
        background3_description: results[:results][2][:alt_description],
        background4_url: results[:results][3][:urls][:full],
        background4_description: results[:results][3][:alt_description],
        background5_url: results[:results][4][:urls][:full],
        background5_description: results[:results][4][:alt_description]
        }
    }
  end
  
  def image_service(location)
    ImageService.new.get_image(format_keyword(location))
  end

  def state_abbrev(location)
    location = location.split(',')[-1].gsub(' ','').upcase
  end

  def format_keyword(location)
    keyword = state_hash[state_abbrev(location)]
    return location if keyword.nil?
    keyword
  end

  def state_hash
    {
      'AL' => 'Alabama',
      'AK' => 'Alaska',
      'AS' => 'America Samoa',
      'AZ' => 'Arizona',
      'AR' => 'Arkansas',
      'CA' => 'California',
      'CO' => 'Colorado',
      'CT' => 'Connecticut',
      'DE' => 'Delaware',
      'DC' => 'District of Columbia',
      'FM' => 'Federated States Of Micronesia',
      'FL' => 'Florida',
      'GA' => 'Georgia',
      'GU' => 'Guam',
      'HI' => 'Hawaii',
      'ID' => 'Idaho',
      'IL' => 'Illinois',
      'IN' => 'Indiana',
      'IA' => 'Iowa',
      'KS' => 'Kansas',
      'KY' => 'Kentucky',
      'LA' => 'Louisiana',
      'ME' => 'Maine',
      'MH' => 'Marshall Islands',
      'MD' => 'Maryland',
      'MA' => 'Massachusetts',
      'MI' => 'Michigan',
      'MN' => 'Minnesota',
      'MS' => 'Mississippi',
      'MO' => 'Missouri',
      'MT' => 'Montana',
      'NE' => 'Nebraska',
      'NV' => 'Nevada',
      'NH' => 'New Hampshire',
      'NJ' => 'New Jersey',
      'NM' => 'New Mexico',
      'NY' => 'New York',
      'NC' => 'North Carolina',
      'ND' => 'North Dakota',
      'OH' => 'Ohio',
      'OK' => 'Oklahoma',
      'OR' => 'Oregon',
      'PW' => 'Palau',
      'PA' => 'Pennsylvania',
      'PR' => 'Puerto Rico',
      'RI' => 'Rhode Island',
      'SC' => 'South Carolina',
      'SD' => 'South Dakota',
      'TN' => 'Tennessee',
      'TX' => 'Texas',
      'UT' => 'Utah',
      'VT' => 'Vermont',
      'VI' => 'Virgin Island',
      'VA' => 'Virginia',
      'WA' => 'Washington',
      'WV' => 'West Virginia',
      'WI' => 'Wisconsin',
      'WY' => 'Wyoming'
    }
  end
end