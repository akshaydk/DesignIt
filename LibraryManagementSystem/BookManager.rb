class BookManager < Account
    def initialize         
    end    

    def self.collect book_item_id, member_id
        if is_fine_pending book_item_id
            return false 
        end

        book_reservation = ReservationsModel.where(member_id: member_id, book_item_id: book_item_id).last
        lent_record = BookLendingModel.where(book_item_id: book_item_id).last

        if book_reservation != nil
            Notifier.notify book_reservation
            book_reservation.status = RESERVATION_STATUS::AVAILABLE
        end
        
        lent_record.status = BOOK_STATUS::RETURNED
        lent_record.save
        return true
    end

    def self.renew  book_item_id, member_id
        if self.is_fine_pending book_item_id
            return false 
        end
        
        book_reservation = ReservationsModel.where(member_id: member_id, book_item_id: book_item_id).last
        lent_record = BookLendingModel.where(book_item_id: book_item_id).last

        if book_reservation != nil and book_reservation.member_id != member_id
            puts "Book is reserved by someone else"
            book_reservation.status = RESERVATION_STATUS::AVAILABLE
            lent_record.staus = LENDING_STATUS.RETURNED
            Notifier.notify book_reservation
            return false
        elsif book_reservation == nil
            lent_record.due_date = Time.now + MAX_LENDING_DAYS * 86400
            lent_record.staus = LENDING_STATUS.RENEWED
        end
        book_reservation.save
        lent_record.save
    end

    def self.issue book_item_id, member_id
        books_issued = BookLendingModel.count(member_id: member_id, status: BOOK_STATUS::LENT)
        if books_issued > CONSTANTS::MAX_BOOKS_TO_BE_ISSUED
            puts "Cannot issue books beyond the maximum limit"
            return false
        end

        book_reservation = ReservationsModel.where(member_id: member_id, book_item_id: book_item_id).last

        if book_reservation != nil and book_reservation.member_id != member_id
            puts "Cannot issue the book as it is reserved by someone else."
            return false
        elsif book_reservation != nil and book_reservation.member_id == member_id
            book_reservation.status = RESERVATION_STATUS::COMPLETED
            book_reservation.save
        end
        BookLendingModel.create(book_item_id: book_item_id, member_id: member_id, issued_at: Time.now, due_date: Time.now + MAX_LENDING_DAYS * 86400, status: 
                            LENDING_STATUS::ACTIVE)
    end
    
    def self.is_fine_pending book_item
        # if Financer.is_fine_pending book_bar_code
        #     puts "Fine has to be paid before returning the book"
        #     return true
        # end
        return false
    end
end