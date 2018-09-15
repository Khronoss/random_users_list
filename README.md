# random_users_list
Shows a list of random users

# Assessment
Build an app that fetch data from this service : https://api.randomuser.me (use https://randomuser.me/api/1.0/?seed=lydia&results=10&page=1 to get 10 contacts for each api call, and increase page param to load more results.
The app must display result in a list of first names and last names, and the email under it.
The app must handle connectivity issue, and display the last results received if it can't retrieve one at launch.
Touching an item of the list should make appear a details page listing every attributes.

The app must be in Swift, any third-party libraries are allowed but you'll have to justify why you use them.

*Estimated time :* 2 working days (or 14 hours)

*Real time :* 1 week of vacation days (meaning more or less around 3 working days, or 21 hours (...I think :| ))

# Before opening the project
Ensure you installed the project's dependencies using Cocoapods.

To do that, go to the project's directory, and launch the command _pod install_ (if cocoapods is not installed on your machine, follow [these instructions](https://guides.cocoapods.org/using/getting-started.html#installation) )

# The dependencies
Trying to use the less dependencies as possible, I've managed to use only 3 I found usefull:
 - Alamofire : For easing the use of network requests
 - AlamofireImage : That decode data recieved through Alamofire into native UIImage objects
 - DynamicColors : For instanciating UIColor with HEX value, and create color from another by changing the alpha component
