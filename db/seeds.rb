# data fetched from randomuser.me api
# ?results=num limits number of users requested
# &inc= limits the attributes returned
# &noinfo returns user data only, not seed, results, page, or version data
rawAuthors = RestClient.get 'https://randomuser.me/api/?results=50&inc=email,login,picture&noinfo'
authors = JSON.parse(rawAuthors)

rawQuotes = RestClient.get 'https://litipsum.com/api/50/json'
quotes = JSON.parse(rawQuotes)

# rawPaintings = RestClient.get 'https://metmuseum.org/api/collection/collectionlisting?hasImages=true&q=portrait&offset=0&pageSize=0&sortBy=Relevance&&showOnly=openaccess'
# paintings = JSON.parse(rawPaintings)

# Author
# attributes: username, password, email, image_url, bio
authors['results'].map do |author|
    Author.create(username: author['login']['username'], password: author['login']['password'], email: author['email'], image_url: author['picture']['medium'], bio: "I like 2 write :)")
end
test_user = Author.create(username: "test", password: "test", email: "test@test.org", image_url: "https://www.andrew.cmu.edu/user/adowling/pokemon!/Images/pikachu.jpg", bio: "pika pika")


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
100.times do
    Story.create(author_id:rand(1..Author.all.length), title: Faker::Book.title, summary: Faker::TvShows::Simpsons.quote)
end
Story.create(author_id:51, title: "Of Hearts and Beans", summary: "Meet me at the crossroads")


# Plot
# attributes: story_id, name, summary
plot_summary_options = ["Rags to Riches (rise)", "Riches to Rags (fall)", "Man in a Hole (fall then rise)", "Icarus (rise then fall)",  "Cinderella (rise then fall then rise)", "Oedipus (fall then rise then fall)"]
50.times do
    # Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
    Plot.create(story_id: rand(1..50), name: Faker::Quote.singular_siegler, summary: plot_summary_options.sample)
end
Plot.create(story_id:101, name: "On the Run", summary: "Rags to Riches (rise)")
Plot.create(story_id:101, name: "Tension crescendo", summary: "Man in a Hole (fall then rise)")

# Plot_note
# attributes: plot_id, text
plot_note_options = ["needs work", "Awaiting S-Reader notes", "⭐️", "🤣", "😰", "💀", "🤠"]
50.times do
    PlotNote.create(plot_id: rand(1..50), text: plot_note_options.sample)
end
PlotNote.create(plot_id: 51, text: "grief arc")
PlotNote.create(plot_id: 51, text: "slow loom")
PlotNote.create(plot_id: 52, text: "repeat the road motif")


scenes_options = [Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Music::Phish.song, Faker::Games::Zelda.location, Faker::Games::Zelda.location, Faker::Games::Zelda.location, Faker::Team.state, Faker::Team.state, Faker::Team.state, Faker::Team.state, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::TvShows::TwinPeaks.location, Faker::Team.state, Faker::Team.state, Faker::Verb.past, Faker::Verb.past, ]
# Scene
# attributes: plot_id, name, summary
50.times do
    Scene.create(plot_id: rand(1..50), name: scenes_options.sample(rand(1..2)).join(" "))
end
Scene.create(plot_id:51, name: "YeeHaw, babey", summary: "YEEEEEHAWWWWW")
Scene.create(plot_id:51, name: "Longing Alert", summary: "Oof :(")
Scene.create(plot_id:51, name: "The Scary Bit", summary: "idk about this bit honestly.")
Scene.create(plot_id:52, name: "Morning Light", summary: "remember to include the big about the window")
Scene.create(plot_id:52, name: "Morning Light Redux", summary: "bowl of oranges...")
Scene.create(plot_id:52, name: "Attic", summary: "goth pastiche bit with the wall")

# Character
# attributes: story_id, name, description
names = [Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.hero, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Ancient.titan, Faker::Name.middle_name,Faker::Name.middle_name,Faker::Name.middle_name]
50.times do
    Character.create(story_id: rand(1..50), name: "#{names.sample} #{Faker::Name.last_name}", description: Faker::Quote.famous_last_words)
end
Character.create(story_id: 101, name: "Jez Jones", description: "Just stares at you like a weird parrot")
Character.create(story_id: 101, name: "Elaine Ogelvy", description: "Fluffy hair, everyone would die for her")

# Character_note
# attributes: character_id, text
character_note_options = ["baby", "can be yuor devil or angle", "uwu", "i'm cry", "I would die for one (1) demon", "BAD", "EVIL", "PURE"]
50.times do
    CharacterNote.create(character_id: rand(1..50), text: character_note_options.sample)
end
CharacterNote.create(character_id:51, text: "grim little thing")
CharacterNote.create(character_id:52, text: "Literal angel")
CharacterNote.create(character_id:52, text: "deep voice!")
CharacterNote.create(character_id:52, text: "Figure out the glasses?")


image_notes_content = ["sort of, but not quite", "eyes", "chapter 4 inspo", "this mood", "just switch the hair and this vibe pretty much"]
# Image:
# attributes: character_id, image_url, note
Character.all.each do |character|
    rand(1..4).times do
        Image.create(character_id: character.id, image_url: "https://www.andrew.cmu.edu/user/adowling/pokemon!/Images/pikachu.jpg", note: image_notes_content.sample)
    end
end

# Appearance
# attributes: scene_id, character_id
50.times do
    Appearance.create(scene_id: rand(1..50), character_id: rand(1..50))
end
Appearance.create(scene_id: 51, character_id:51)
Appearance.create(scene_id:51, character_id:52)
Appearance.create(scene_id:52, character_id:51)
Appearance.create(scene_id:52, character_id:52)
# Appearance_note
# attributes: appearance_id, text
appearance_note_contents = ["FINALLY", "omg", "they made it 😭", "oh no baby what is you doin", "i honestly don't know how they're gonna get out of this one", "meet cute", "big conflict", "first contact", "last shared scene"]
Appearance.all.each do |appearance|
    rand(1..5).times do
        AppearanceNote.create(appearance_id: appearance.id, text: appearance_note_contents.sample )
    end
end


puts "Seed Successful!"