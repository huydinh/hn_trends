desc "This task is called by the Heroku scheduler add-on"
task :fetch_hn_entries => :environment do
  puts "Fetching HN entries..."

  Entry.fetch
  HottestWord.update_hottest_words

  puts "done."
end
