class Catalogue
    def initialize
        @book_titles = {}
        @book_authors = {}
        @book_subject = {}
        @publication_dates = {}
    end

    def search_by_book_title title
        @book_title.fetch title
    end

    def search_by_author author
        @book_authors.fetch author 
    end

    def search_by_subject subject
        @search_by_subject.fetch subject
    end
end