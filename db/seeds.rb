User.destroy_all
Channel.destroy_all
Message.destroy_all



10.times do 
    name = Faker::Internet.slug
    Channel.create(name: name)
end

20.times do 
    name = Faker::FunnyName.two_word_name
    username = name.split(' ').join('').downcase
    email = Faker::Internet.email
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    password_digest = BCrypt::Password.create('p@ssw0rd', cost: cost)
    user = User.create(username: username, name: name, email: email, password_digest: password_digest) 

    
    10.times do 
        channel = Channel.all.sample
        content = Faker::Hipster.sentences(1)
        Message.create(user_id: user.id, channel_id: channel.id, content: content )
    end

end



