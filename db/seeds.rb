# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times { |i| GoFundMe.create(title: "campaign #{i}", beneficiary: "BLAH BLAH BLAH", embed: "<iframe class='gfm-media-widget' image='1' coinfo='1' width='100%' height='100%' frameborder='0' id='united-way-of-wine-country'></iframe><script src='//funds.gofundme.com/js/5.0/media-widget.js'></script>" ,user_id: 1) }