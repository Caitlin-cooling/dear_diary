require 'entry'

describe Entry do
  describe '#all' do
    it 'shows a list of all entries' do
      entries = Entry.all
      expect(entries).to include "Monday"
    end
  end
end
