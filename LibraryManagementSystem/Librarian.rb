class Librarian < Account
    def initialize username, bar_code_id
        super username, bar_code_id
    end

    def add_book_item title, authors, language, rack_id 
        book_item = BookItemModel.new
        book_item.title = title
        book_item.authors = authors
        book_item.language = language
        book_item.rack_id = get_rand
        book_item.status = BOOK_STATUS::AVAILABLE
        book_item.save
        return true
    end

    def remove_book_item book_item_id
        BookItemModel.where(id: book_item_id).delete
    end

    def create_member name
    end

    def block_member member_id
    end

    def unblock_member member_id
    end

    private
    def get_rand
        return rand(1000)
    end
end