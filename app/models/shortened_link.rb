class ShortenedLink
  def self.generate_random_string(size = 6)
    charset = ('a'..'z').to_a + (0..9).to_a
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end