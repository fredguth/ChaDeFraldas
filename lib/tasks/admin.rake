namespace :email do
  desc "Pega os emails das autoras dos blogs"
  task :autoras => :environment do
    Author.all.each do |author|
      puts "#{author.name}, #{author.email}, #{author.blog.name}" if author.email?
    end
  end

  # desc "Pega os emails dos usuários do site"
  # task :usuarios => :environment do
  #   puts "Prize: #{pick(Product).name}"
  # end
  
  # desc "Pick a random prize and winner"
  # task :all => [:prize, :winner]
  
  # def pick(model_class)
  #   model_class.find(:first, :order => 'RAND()')
  # end
end