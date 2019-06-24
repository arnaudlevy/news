namespace :news do
  desc "Sync all feeds"
  task sync: :environment do
    Entry.old.destroy_all
    Feed.sync_all
  end
end
