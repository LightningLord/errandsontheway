require 'spec_helper'

describe ShortenedLink do
  it "should return a random string" do
    link_a = ShortenedLink.generate_random_string
    link_b = ShortenedLink.generate_random_string
    expect(link_a).to_not eql(link_b)
  end
end