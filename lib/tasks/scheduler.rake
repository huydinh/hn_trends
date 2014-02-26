desc "This task is called by the Heroku scheduler add-on"
task :fetch_hn_entries => :environment do
  puts "Fetching HN entries..."

  Entry.fetch
  Rails.cache.write('all_ranked_words', Word.ranked)

  puts "done."
end
