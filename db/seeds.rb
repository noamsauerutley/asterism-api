# data fetched from randomuser.me api
# ?results=num limits number of users requested
# &inc= limits the attributes returned
# &noinfo returns user data only, not seed, results, page, or version data
rawAuthors = RestClient.get 'https://randomuser.me/api/?results=50&inc=email,login,picture&noinfo'
authors = JSON.parse(rawAuthors)

rawQuotes = RestClient.get 'https://litipsum.com/api/50/json'
quotes = JSON.parse(rawQuotes)

rawPaintings = RestClient.get 'https://metmuseum.org/api/collection/collectionlisting?hasImages=true&q=portrait&offset=0&pageSize=0&sortBy=Relevance&sortOrder=asc&showOnly=openaccess'
paintings = JSON.parse(rawPaintings)

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


# Story
# attributes: author_id, title, summary
50.times do
    Story.create(author_id:rand(1..50), title: Faker::Book.title, summary: Faker::TvShows::Simpsons.quote)
end

plot_summary_options = ["Rags to Riches (rise)", "Riches to Rags (fall)", "Man in a Hole (fall then rise)", "Icarus (rise then fall)",  "Cinderella (rise then fall then rise)", "Oedipus (fall then rise then fall)"]


# Plot
# attributes: story_id, name, summary
50.times do
    # Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
    Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
end

plot_note_options = ["needs work", "Awaiting S-Reader notes", "⭐️", "🤣", "😰", "💀", "🤠"]

# Plot_note
# attributes: plot_id, text
50.times do
    PlotNote.create(plot_id: rand(1..50), text: plot_note_options.sample)
end

scenes_options = [Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Games::Zelda.location, Faker::Games::Zelda.location, Faker::Games::Zelda.location, Faker::Team.state, Faker::Team.state, Faker::Team.state, Faker::Team.state, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::Team.state, Faker::Team.state, Faker::Verb.past, Faker::Verb.past, ]
# Scene
# attributes: plot_id, name, summary
50.times do
    Scene.create(plot_id: rand(1..50), name: scenes_options.sample(rand(1..2)).join(" "))
end

# Character
# attributes: story_id, name, description
names = [Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Name.middle_name,Faker::Name.middle_name,Faker::Name.middle_name]
50.times do
    Character.create(story_id: rand(1..50), name: "#{names.sample} #{Faker::Name.last_name}", description: Faker::Quote.famous_last_words)
end

# Character_note
# attributes: character_id, text
character_note_options = ["baby", "can be yuor devil or angle", "uwu", "i'm cry", "I would die for one (1) demon", "BAD", "EVIL", "PURE"]
50.times do
    CharacterNote.create(character_id: rand(1..50), text: character_note_options.sample)
end


# Gallery
# attributes: character_id
Character.all.each do |character|
    Gallery.create(character_id: character.id)
end

image_notes_content = ["sort of, but not quite", "eyes", "chapter 4 inspo", "this mood", "just switch the hair and this vibe pretty much"]
# Image:
# attributes: gallery_id, image_url, note
Gallery.all.each do |gallery|
    rand(1..4).times do
        Image.create(gallery_id: gallery.id, image_url: paintings['results'].sample['image'], note: image_notes_content.sample)
    end
end



# Appearance
# attributes: scene_id, character_id
50.times do
    Appearance.create(scene_id: rand(1..50), character_id: rand(1..50))
end

appearance_note_contents = ["FINALLY", "omg", "they made it 😭", "oh no baby what is you doin", "i honestly don't know how they're gonna get out of this one", "meet cute", "big conflict", "first contact", "last shared scene"]
# Appearance_note
# attributes: appearance_id, text
Appearance.all.each do |appearance|
    rand(1..5).times do
        AppearanceNote.create(appearance_id: appearance.id, text: appearance_note_contents.sample )
    end
end


puts "Seed Successful!"