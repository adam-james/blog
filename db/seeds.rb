
email = 'user@example.com'

unless User.where(email: email).first.present?
  user = User.create!(email: email, password: 'Changeme123')

  body = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu p'
  
  25.times do |i|
    Post.create!(
      title: "title #{i}",
      body: body,
      author: user
    )
  end
end
