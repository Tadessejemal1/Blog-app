# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create at least one user
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# Create at least 4 posts written by one of the users
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'programming', text: 'This programming chapter')
third_post = Post.create(author: second_user, title: 'software', text: 'This is software text')
fourth_post = Post.create(author: first_user, title: 'Algorithm', text: 'This is Algorithm challenge')

# Create at least 6 posts comments for one of the posts you created
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: second_post, author: second_user, text: 'This is second post')
Comment.create(post: third_post, author: third_user, text: 'This is third post')
Comment.create(post: fourth_post, author: fourth_user, text: 'This is fourth post')
Comment.create(post: fifth_post, author: fifth_user, text: 'there is alternative way')
Comment.create(post: six_post, author: six_user, text: 'this is the end')