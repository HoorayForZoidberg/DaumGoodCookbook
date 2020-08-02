desc "This task will delete old metrics to preserve database space. It is called by the Heroku scheduler add-on"
task :delete_old_metrics => :environment do
  Ahoy::Visit.where("started_at < ?", 2.months.ago).find_in_batches do |visits|
    visit_ids = visits.map(&:id)
    Ahoy::Event.where(visit_id: visit_ids).delete_all
    Ahoy::Visit.where(id: visit_ids).delete_all
  end
end
