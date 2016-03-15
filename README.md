# 1DV450_mi222ep
Repository for the course "Webbramverk" at Linnéuniversitetet
#Api
## To get the application up and running:
* Download the project repository
* Open a console application and navigate to the project root
* Run the command 'bundle install' to install all gems and bundles
* Run the command 'rake db:setup' to setup the database and seed it
* If you can se the registration application at localhost:3000, the servers are up and you are ready to use the api!

## Testing by postman
The api has preset postman tests, that can be found here. Some of the tests require a valid api authentication token. To accuire this you must sign in with twitter. Navigate to localhost:3000/authenticate to be redirected to a twitter verification page. Accept the application and sign in using twitter.
You will be redirected to the start page of the registration application. In the query string you now have the auth_token value.
http://localhost:3000/?      auth_token=AKvPvzar7fuNLVaKdmoLnA        &token_expires=2016-03-15+20%3A31%3A46+UTC
Copy the value of auth_token and replace the header value of "X-auth-token" to the auth_token value.
All tests should now be runnable. 

#Registration application
##To get the application up and running:
* Download the project repository
* Open a console application and navigate to the project root
* Run the command 'bundle install' to install all gems and bundles
* Run the command 'rake db:setup' to setup the database and seed it
* Run the command 'rails s' to start the server
* You should now be able to reach the application at localhost:3000

The admin is hard coded now as user with ID number 1. His username is "john_Snow" and password "4thewall" if you use the seed files. If not, admin will be the first user created. 
