class ReleaseMailSender
  def self.book_release_mail
    User.notify_release_book
  rescue => e
    Rails.logger.error(e.inspect)
  end
end