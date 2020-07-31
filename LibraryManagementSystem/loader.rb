require 'Sequel'
DB = Sequel.connect('sqlite://library.db')

load './Account.rb'
load './BookItem.rb'
load './BookManager.rb'
load './Catalogue.rb'
load './Constants.rb'
load './Librarian.rb'
load './Member.rb'
load './Models.rb'
load './Notifier.rb'
load './Rack.rb'