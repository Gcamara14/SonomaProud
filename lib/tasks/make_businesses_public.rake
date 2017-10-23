task :business_tweak => :environment do
  ActiveRecord::Base.transaction do    
    bis_count = 0
		# makes all existing businesses to public
    Business.all.each do |business|
      business.update_attributes!(published: true)
      bis_count += 1
      print "."
    end

    puts "\n#{bis_count} businesses updated."
  end
end
