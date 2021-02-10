# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
User.destroy_all

User.create(first_name: 'Chad', last_name: 'McChadson', email: 'anotherchad@lotsofchads.com', password: 'password')
User.create(first_name: 'Linda', last_name: 'McLindason', email: 'anotherLinda@lotsofLindas.com', password: 'password')
User.create(first_name: 'Donald', last_name: 'McDonaldson', email: 'anotherDonald@lotsofDonalds.com', password: 'password')
User.create(first_name: 'Kelly', last_name: 'McKellyson', email: 'anotherKelly@lotsofKellys.com', password: 'password')
User.create(first_name: 'Lucas',    last_name: 'McLucasson', email: 'anotherLucas@lotsofLucass.com', password: 'password')
User.create(first_name: 'Michelle', last_name: 'McMichelleson', email: 'anotherMichelle@lotsofMichelles.com', password: 'password')
User.create(first_name: 'Paul',     last_name: 'McPaulson', email: 'anotherPaul@lotsofPauls.com', password: 'password')
User.create(first_name: 'Jean',     last_name: 'McJeanson', email: 'anotherJean@lotsofJeans.com', password: 'password')
User.create(first_name: 'Kayla',    last_name: 'McKaylason', email: 'anotherKayla@lotsofKaylas.com', password: 'password')
User.create(first_name: 'Chase',    last_name: 'McChaseson', email: 'anotherChase@lotsofChases.com', password: 'password')