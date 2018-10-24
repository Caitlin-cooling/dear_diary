def setup_test
  conn = PG.connect(dbname: 'dear_diary_test')
  conn.exec('DROP TABLE IF EXISTS entries;')
  conn.exec('CREATE TABLE entries(id SERIAL PRIMARY KEY, title TEXT, content TEXT);
')
end
