# data fetched from randomuser.me api
# ?results=num limits number of users requested
# &inc= limits the attributes returned
# &noinfo returns user data only, not seed, results, page, or version data
rawAuthors = RestClient.get 'https://randomuser.me/api/?results=50&inc=email,login,picture&noinfo'
authors = JSON.parse(rawAuthors)

rawQuotes = RestClient.get 'https://litipsum.com/api/50/json'
quotes = JSON.parse(rawQuotes)


# Author
# attributes: username, password, email, image_url, bio
authors['results'].map do |author|
    Author.create(username: author['login']['username'], password: author['login']['password'], email: author['email'], image_url: author['picture']['medium'], bio: "I like 2 write :)")
end

# Fragment
#attributes: author_id, title, text
quotes['text'].map do |quote|
    Fragment.create(author_id: rand(1..50), title: Faker::GreekPhilosophers.quote, text: quote )
end

frag_notes = ["I like this but don't know where it fits :(", "needs editing", "Add to WIP", "Add to phase 4?", "save for later", "seed idea", "baby", "😭", "🤔"]
# Fragment_Note
# attributes: fragment_id, text
Fragment.all.map do |fragment|
    rand(1..5).times do
        FragmentNote.create(fragment_id: fragment.id, text: frag_notes.sample)
    end
end

story_title_words = [Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle,Faker::Verb.past_participle, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.shard, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Space.nasa_space_craft, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Cosmere.surge, Faker::Space.nasa_space_craft, Faker::Space.nasa_space_craft, Faker::Space.nasa_space_craft, Faker::Space.nasa_space_craft, Faker::Space.nasa_space_craft, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.constellation, Faker::Space.galaxy, Faker::Space.galaxy, Faker::Space.galaxy, Faker::Space.galaxy, Faker::Space.galaxy, Faker::Space.galaxy, Faker::Space.galaxy]

# Story
# attributes: author_id, title, summary
50.times do
    Story.create(author_id:rand(1..50), title: story_title_words.sample(rand(1..3)).join(" ").titleize, summary: Faker::TvShows::Simpsons.quote)
end

plot_summary_options = ["Rags to Riches (rise)", "Riches to Rags (fall)", "Man in a Hole (fall then rise)", "Icarus (rise then fall)",  "Cinderella (rise then fall then rise)", "Oedipus (fall then rise then fall)"]


# Plot
# attributes: story_id, name, summary
50.times do
    # Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
    Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
end

# Plot_note
# attributes: plot_id, text

# Scene
# attributes: plot_id, name, summary

# Character
# attributes: story_id, name, description

# Character_note
# attributes: character_id, text

# Gallery
# attributes: character_id

# Image:
# attributes: gallery_id, image_url, note

# Appearance
# attributes: scene_id, character_id

# Appearance_note
# attributes: appearance_id, text


puts "Seed Successful!"