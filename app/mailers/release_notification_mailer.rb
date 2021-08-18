class ReleaseNotificationMailer < ApplicationMailer

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
