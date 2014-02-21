namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    Workday.create(text: "Sunday")
    Workday.create(text: "Monday")
    Workday.create(text: "Tuesday")
    Workday.create(text: "Wednesday")
    Workday.create(text: "Thursday")
    Workday.create(text: "Friday")
    Workday.create(text: "Saturday")
    
    ScheduleType.create(text: "Appointment")
    ScheduleType.create(text: "Vacation")
    ScheduleType.create(text: "Day off")
    ScheduleType.create(text: "Lunch")
    ScheduleType.create(text: "Sick day")
    
    User.create!(name: "Jonas Galante",
                 email: "jonasfg@gmail.com",
                 password: "123456",
                 password_confirmation: "123456",
                 admin: true)
    @mila = User.create!(name: "Camila Mello",
                 email: "camila@gmail.com",
                 password: "123456",
                 password_confirmation: "123456",
                 employee: true)
    
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 2,
                          start_time: "08:00",
                          end_time: "18:00")
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 3,
                          start_time: "08:00",
                          end_time: "18:00")
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 4,
                          start_time: "09:00",
                          end_time: "18:00")
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 5,
                          start_time: "08:30",
                          end_time: "18:30")
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 6,
                          start_time: "08:00",
                          end_time: "17:00")
    WeeklySchedule.create(employee_id: @mila.id,
                          workday_id: 7,
                          start_time: "10:00",
                          end_time: "14:00")
    
    1.times do |n|
      name  = Faker::Name.name
      email = "employee-#{n+1}@exemple.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   employee: true)
    end
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
    
    EmployeeService.create(employee_id: 2, service_id:1)
    EmployeeService.create(employee_id: 2, service_id:3)
    EmployeeService.create(employee_id: 2, service_id:5)
    EmployeeService.create(employee_id: 3, service_id:1)
    EmployeeService.create(employee_id: 3, service_id:6)
    
    
    
  end
end
