FactoryGirl.define do

  factory :image do
    name {|n| "Caption #{n}" }
    original_source {|n| "http://i.imgur.com/#{n}.gif" }
    bytes { 1.megabyte }
    shortcode {|n| n.to_s }
  end

  factory :user do
    authentication_token {|n| "token-#{n}" }
  end
end
