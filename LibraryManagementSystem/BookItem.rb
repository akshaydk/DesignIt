class BookItem
    attr_reader :status

    def initialize title, authors, language, barcode, status, rack_id, lending_id
        @title = title
        @authors = authors
        @language = language
        @barcode = barcode
        @status = status
        @lending_id = lending_id
        @rack_id = rack_id
    end
end