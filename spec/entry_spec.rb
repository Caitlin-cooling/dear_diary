require 'entry'
require 'pg'

describe Entry do
  describe '#all' do

    before(:each) do
      conn = PG.connect(dbname: 'dear_diary_test')
      conn.exec('TRUNCATE entries;')
    end

    it 'return all entries' do

      conn = PG.connect(dbname: 'dear_diary_test')

      conn.exec("INSERT INTO entries (content) VALUES ('Monday');")
      conn.exec("INSERT INTO entries (content) VALUES ('Tuesday');")
      conn.exec("INSERT INTO entries (content) VALUES ('Wednesday');")


      entries = Entry.all
      expect(entries).to include("Monday")
      expect(entries).to include("Tuesday")
      expect(entries).to include("Wednesday")
    end
  end
end
