require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
roles = ['Family Physician', 'Pediatrician', 'Gynecologist (OB/GYN)',
'Surgeon', 'Psychiatrist', 'Cardiologist', 'Dermatologist', 'Endocrinologist',
'Gastroenterologist', 'Nephrologist', 'Ophthalmologist', 'Otolaryngologist',
'Pulmonologist', 'Neurologist', 'Radiologist', 'Anesthesiologist',
'Oncologist']

roles.each do |role|
    c_role = Role.create(name: role)
    10.times do |n|
        name = (Faker::Name.unique.name).split
        num = rand(1...3)
        education = Faker::University.name
        num.times do |m|
            education += '--'
            education += Faker::University.name            
        end
        c_role.doctors.create(first_name: name[0], last_name: name[1], price: rand(200...10000), years_experience: rand(1...40), likes_count: rand(1...1000), educations: education)
    end
end