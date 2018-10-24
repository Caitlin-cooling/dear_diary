require 'entry'
require 'pg'

describe Entry do

  describe '::all' do
    it 'return all entries' do
      Entry.create("Monday", "Hi")
      entries = Entry.all
      expect(entries.first.title).to eq "Monday"
      expect(entries.first.content).to eq "Hi"
    end
  end

  describe '::create' do
    it 'should create a new entry in the database' do
      new_entry = Entry.create("Test", "Hi there")
      entries = Entry.all
      expect(entries.first.title).to eq "Test"
    end
  end
end
