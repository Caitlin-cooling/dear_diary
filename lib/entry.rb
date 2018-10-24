require 'pg'

class Entry
  @conn = nil
  attr_reader :id, :title, :content

  def self.all
   find_db
    result = @conn.exec("SELECT * FROM entries")
    result.map do |entry|
      Entry.new(entry['id'], entry['title'], entry['content'])
    end
  end

  def self.create(title, content)
    find_db
    @conn.exec("INSERT INTO entries (title,content) VALUES('#{title}','#{content}')")
  end

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  private
  def self.find_db
    @conn = if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'dear_diary_test')
    else
      conn = PG.connect(dbname: 'dear_diary')
    end
  end
end
