require 'entry'
require 'pg'

describe Entry do

  describe '::all' do
    it 'return all entries' do
      Entry.create("Monday", "Do something")
      entries = Entry.all
      expect(entries.first.title).to eq "Monday"
      expect(entries.first.content).to eq "Do something"
    end
  end

  describe '::create' do
    it 'should create a new entry in the database' do
      new_entry = Entry.create("Test", "Hi there")
      entries = Entry.all
      expect(entries.first.title).to eq "Test"
    end
  end

  describe '::update' do
    it 'updates the title and content of an entry in the db' do
      Entry.create("Monday", "Do something")
      title = 'Tuesday'
      content = "Do something better"
      Entry.update(1, title, content)
      expect(Entry.all.first.title).to eq "Tuesday"
      expect(Entry.all.first.content).to eq "Do something better"
    end
  end

  describe '::delete' do
    it 'deletes the entry from the db' do
      Entry.create("Monday", "Do something")
      Entry.create("Tuesday", "Do something better")
      Entry.delete(1)
      expect(Entry.all.first.title).to eq "Tuesday"
      expect(Entry.all.first.content).to eq "Do something better"
    end
  end
end
