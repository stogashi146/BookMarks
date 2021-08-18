 User.all.each do |user|
   if user.is_mail_send == true
     user.unread_books do |book|
       if book.sales_date == Date.tomorrow
         user = user.id
         book = book.id
         p "発売"
       end
     end
   end
  end