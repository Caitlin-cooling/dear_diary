require 'pg'

class Entry

  def self.all
   if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'dear_diary_test')
    else
      conn = PG.connect(dbname: 'dear_diary')
    end
    entries = []
    result = conn.exec("SELECT * FROM entries")
    result.each do |entry|
      entries << entry['content']
    end
    entries.join(", ")
  end

  def self.create(content)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'dear_diary_test')
    else
      conn = PG.connect(dbname: 'dear_diary')
    end
    conn.exec("INSERT INTO entries (content) VALUES('#{content}')")
  end

end
