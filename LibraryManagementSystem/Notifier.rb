class Notifier
    def initilize         
    end 

    def self.notify member_id, book_id 
        #Add a background job to process the notification
        # remove member_id, book_id
        return true
    end

    def self.add member_id, book_id
        NotificationsModel.create(member_id: member_id, book_item_id: book_id)
    end
    
    def self.remove member_id, book_id
        NotificationsModel.where(member_id: member_id, book_item_id: book_id).delete
    end
end