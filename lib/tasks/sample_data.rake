namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:Name => "Example User",
                 :Email => "a@example.com",
                 :password => "password",
                 :password_confirmation => "password")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(:Name => name,
                   :Email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end