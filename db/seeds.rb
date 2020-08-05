puts "Destroying users, trackers, and diary cards"
User.destroy_all

puts "Creating users"
alice = User.create(first_name: "Alice", email: "alice@email.com", password: "abc123")

puts "Creating trackers"
mood = Tracker.create(user: alice, name: "Mood")

puts "Creating diary cards"
card = DiaryCard.create(user: alice, thoughts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", feelings: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

puts "Creating diary card trackers"
DiaryCardTracker.create(diary_card: card, tracker: mood, score: 5)