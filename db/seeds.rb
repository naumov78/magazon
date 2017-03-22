

User.delete_all
CartProduct.delete_all
Cart.delete_all
Category.delete_all
ProductCategory.delete_all
Product.delete_all


books = Category.create!(title: 'Books')
movies = Category.create!(title: 'Movies')
music = Category.create!(title: 'Music')
games = Category.create!(title: 'Games')
electronics = Category.create!(title: 'Electroniics')
computers = Category.create!(title: 'Computers')
home = Category.create!(title: 'Home')
garden = Category.create!(title: 'Garden')
tools = Category.create!(title: 'Tools')


user1 = User.create!(first_name: "Bob", last_name: "Smith", email: "smith@gmail.com", password: "123456")

product1 = Product.create!(
title: 'Cracking the Coding Interview: 189 Programming Questions and Solutions',
brief_description: 'I am not a recruiter. I am a software engineer. And as such, I know what it\'s like to be asked to whip up brilliant algorithms on the spot and then write flawless code on a whiteboard. I\'ve been through this as a candidate and as an interviewer. Cracking the Coding Interview, 6th Edition is here to help you through this process, teaching you what you need to know and enabling you to perform at your very best. I\'ve coached and interviewed hundreds of software engineers. The result is this book.',
full_description: 'I am not a recruiter. I am a software engineer. And as such, I know what it\'s like to be asked to whip up brilliant algorithms on the spot and then write flawless code on a whiteboard. I\'ve been through this as a candidate and as an interviewer. Cracking the Coding Interview, 6th Edition is here to help you through this process, teaching you what you need to know and enabling you to perform at your very best. I\'ve coached and interviewed hundreds of software engineers. The result is this book.
Learn how to uncover the hints and hidden details in a question, discover how to break down a problem into manageable chunks, develop techniques to unstick yourself when stuck, learn (or re-learn) core computer science concepts, and practice on 189 interview questions and solutions.
These interview questions are real; they are not pulled out of computer science textbooks. They reflect what\'s truly being asked at the top companies, so that you can be as prepared as possible.',
price: 26.79)

ProductCategory.create!(product_id: product1.id, category_id: books.id)

product2 = Product.create!(
title: 'Beauty and the Beast: 25th Anniversary Edition - (BD+DVD+DIGITAL HD) [Blu-ray]',
full_description: 'Be our guest at the enchanted 25th Anniversary celebration of BEAUTY AND THE BEAST, universally acclaimed as one of Disney\'s finest animated features and now honored in the Walt Disney Signature Collection. Join brave, independent Belle on the adventure of a lifetime as she sets out to rescue her father and finds herself in the enchanted castle of a mysterious beast. Enjoy this timeless tale overflowing with unforgettable characters and Academy Award(R)-winning music (Best Song, Best Score, 1991)! | It took more than 600 animators, artists, and technicians three and a half years to complete the project.| BEAUTY is the first animated Disney feature scripted by a woman, Linda Woolverton.| The film marked the first time each animator was credited on screen specifically for the character he or she brought to life.| Disney\'s animation department won a Scientific and Technical Academy Award for the design and development of the Computer Animated Production System used to make the film.| The style of illustration was inspired by French painters Fragonard and Boucher.',
price: 19.99)

ProductCategory.create!(product_id: product2.id, category_id: movies.id)

product3 = Product.create!(
title: 'Sauder Beginnings 4-Drawer Chest, Cinnamon Cherry',
brief_description: 'This Product Four easy-glide drawers with safety stops .Three lower drawers are extra-deep. Made in USA.',
full_description: 'This Product Four easy-glide drawers with safety stops .Three lower drawers are extra-deep. Made in USA.',
price: 85.00)

ProductCategory.create!(product_id: product3.id, category_id: home.id)

product4 = Product.create!(
title: 'Elite 54" Wall Cabinet',
brief_description: 'This 3-door cabinet is 54 inches wide, which is the ideal width for placement above a standard washer and dryer.',
full_description: 'This 3-door cabinet is 54 inches wide, which is the ideal width for placement above a standard washer and dryer. It includes 2 adjustable shelves and the doors can be attached to open to the left or to the right depending or your room configuration. ELITE’s quality features include distinctive Soft Edged Doors, Designer Hardware, Attractive Finishes and European Style Hinges. Note - The 54” Wall Cabinet has been designed as a stand-alone piece and is best suited for above a washer & dryer. It is shallower (12” deep) than the other wall cabinets from the Elite Storage Collection (16” deep).',
price: 122.48)

ProductCategory.create!(product_id: product4.id, category_id: home.id)

product5 = Product.create!(
title: 'Elite 32" Wardrobe Cabinet',
brief_description: 'This 20-inch deep Wardrobe Cabinet includes one hanging rail for clothes as well as a fixed top shelf for hats and other small items.',
full_description: 'This 20-inch deep Wardrobe Cabinet includes one hanging rail for clothes as well as a fixed top shelf for hats and other small items. Use alone or add the optional 32” Topper (WEW-3224) for 89” high storage. ELITE’s quality features include distinctive Soft Edged Doors, Designer Hardware, Attractive Finishes and European Style Hinges',
price: 125.35)

ProductCategory.create!(product_id: product5.id, category_id: home.id)

cart1 = Cart.create!(user_id: user1.id)
user1.cart_id = cart1.id
user1.save!

CartProduct.create(cart_id: cart1.id, product_id: product4.id)
CartProduct.create(cart_id: cart1.id, product_id: product5.id)
