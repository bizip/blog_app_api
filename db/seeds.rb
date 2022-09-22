# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Pascal',email: 'issa@gmail.com' , password: '123456' photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', 
bio: 'Bacon ipsum dolor amet tri-tip short ribs pork ball tip bresaola turkey. Prosciutto swine capicola jerky pork chop frankfurter picanha fatback corned beef. Strip steak turkey filet mignon kevin short ribs shank chuck bresaola hamburger pork jowl spare ribs. Leberkas tail')
user2 = User.create(name: 'Bizimungu',email: 'issa1@gmail.com' , password: '123456' photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Bacon ipsum dolor amet tri-tip short ribs pork ball tip bresaola turkey. Prosciutto swine capicola jerky pork chop frankfurter picanha fatback corned beef. Strip steak turkey filet mignon kevin short ribs shank chuck bresaola hamburger pork jowl spare ribs. Leberkas tail')
user3 = User.create(name: 'Penguin', email: 'issa2@gmail.com', password: '123456' photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'DevBacon ipsum dolor amet tri-tip short ribs pork ball tip bresaola turkey. Prosciutto swine capicola jerky pork chop frankfurter picanha fatback corned beef. Strip steak turkey filet mignon kevin short ribs shank chuck bresaola hamburger pork jowl spare ribs. Leberkas tail')
user4 = User.create(name: 'Janeete',email: 'issa2@gmail.com' , password: '123456' photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'SingeBacon ipsum dolor amet tri-tip short ribs pork ball tip bresaola turkey. Prosciutto swine capicola jerky pork chop frankfurter picanha fatback corned beef. Strip steak turkey filet mignon kevin short ribs shank chuck bresaola hamburger pork jowl spare ribs. Leberkas tail')

post1 = Post.create(author: user1, title: 'Hello', text: 'TBacon ipsum dolor amet tri-tip short ribs pork ball ')
post2 = Post.create(author: user1, title: 'Hello', text: 'ThBacon ipsum dolor amet tri-tip short ribs pork ball ')
post3 = Post.create(author: user2, title: 'Hello', text: 'TBacon ipsum dolor amet tri-tip short ribs pork ball ')
post4 = Post.create(author: user2, title: 'Hello', text: 'ThBacon ipsum dolor amet tri-tip short ribs pork ball ')
post5 = Post.create(author: user3, title: 'Hello', text: 'TBacon ipsum dolor amet tri-tip short ribs pork ball ')

comment1 = Comment.create(post: post1, author: user, text: 'Hi Pascal! I can\'t wait to comment on this thank you' )
comment2 = Comment.create(post: post1, author: user2, text: 'Hello Tomas!' )
comment3 = Comment.create(post: post2, author: user2, text: 'Hi!' )
comment4 = Comment.create(post: post2, author: user1, text: 'Hey!' )
comment5 = Comment.create(post: post3, author: user1, text: 'greatings!' )
comment6 = Comment.create(post: post3, author: user3, text: 'Hello 2!' )
comment6 = Comment.create(post: post4, author: user4, text: 'Hello!' )
