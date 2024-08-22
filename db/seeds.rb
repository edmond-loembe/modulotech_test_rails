User.find_or_create_by!(email: 'uno@test.test') { |u| u.password = '123456' }
User.find_or_create_by!(email: 'duo@test.test') { |u| u.password = '123456' }
User.find_or_create_by!(email: 'trio@test.test') { |u| u.password = '123456' }

uno = User.find_by(email: 'uno@test.test')
duo = User.find_by(email: 'duo@test.test')
trio = User.find_by(email: 'trio@test.test')

# Création des chambres
room1 = Room.find_or_create_by!(name: 'Cozy Studio in the City', location: 'Downtown', price_per_night: 100.00, description: 'A cozy studio apartment in the heart of the city.') do |room|
  room.user = uno
end

room2 = Room.find_or_create_by!(name: 'Spacious Country House', location: 'Countryside', price_per_night: 200.00, description: 'A spacious house with a beautiful garden and countryside views.') do |room|
  room.user = duo
end

# Ajouter des images
Image.find_or_create_by!(room: room1, url: 'http://example.com/cozy_studio.jpg')
Image.find_or_create_by!(room: room2, url: 'http://example.com/spacious_house.jpg')

# Création des réservations
Booking.find_or_create_by!(user: uno, room: room1, start_date: 1.month.from_now, end_date: 1.month.from_now + 3.days)
Booking.find_or_create_by!(user: duo, room: room2, start_date: 2.weeks.from_now, end_date: 2.weeks.from_now + 1.week)
