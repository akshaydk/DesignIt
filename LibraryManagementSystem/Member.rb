class Member < Account
    attr_reader :id
    def initialize name, bar_code_id, id
        super name, bar_code_id 
        @id = id
    end

    def checkout book_item_id
        puts 'Issuing the book'
        BookManager.issue book_item_id, @id
    end

    def return_book book_item_id
        BookManager.collect book_item_id, @id
    end

    def renew book_item_id
        BookManager.renew book_item_id, @id
    end
    
    def notify_me book_item_id        
        Notifier.add @id, book_item_id
    end
end