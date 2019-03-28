namespace :news do
  desc "Sync all feeds"
  task sync: :environment do
    Feed.sync_all
  end
end
