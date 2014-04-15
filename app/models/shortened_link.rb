class ShortenedLink

  # I would make charset a private method. This is nice, but I think that I
  # would just do something like: `SecureRandom.urlsafe_base64[0...6]`
  def self.generate_random_string(size = 6)
    charset = ('a'..'z').to_a + (0..9).to_a
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end