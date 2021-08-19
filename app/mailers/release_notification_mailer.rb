class ReleaseNotificationMailer < ApplicationMailer
  def book_release_mail
    User.all.each do |user|
      if user.is_mail_send == true
        books = []
        user.unread_books.each do |book|
          books << book if book.sales_date == Time.current.tomorrow.to_date
        end
        ReleaseNotificationMailer.send_release_mail(books, user).deliver if books.present?
      else
        return
      end
    end
  end

  def send_release_mail(books, user)
    @books = books
    @user = user
    if @books.count >= 2
      mail(
          subject: "#{@books.first.title}他#{@books.count}冊の発売前日です" ,
          to: @user.email
        )
    else
      mail(
          subject: "#{@books.first.title}の発売前日です" ,
          to: @user.email
        )
    end
  end

end
