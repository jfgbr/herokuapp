namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Jonas Galante",
                 email: "jonasfg@gmail.com",
                 password: "123456",
                 password_confirmation: "123456",
                 admin: true)
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@exemple.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    Category.create!(text: "Eyebrow")
    Category.create!(text: "Eyelash")
    Category.create!(text: "Body waxing")
    Category.create!(text: "Makeup")
    
    Service.create(text: "First Brow Shaping", category_id: 1);
    Service.create(text: "Return Brow Shaping", category_id: 1);
    Service.create(text: "Lash Tint", category_id: 2);
    Service.create(text: "Lash Perm", category_id: 2);
    Service.create(text: "Lip", category_id: 3);
    Service.create(text: "Brazilian", category_id: 3);
    Service.create(text: "Makeup", category_id: 4);
  end
end
