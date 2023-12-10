# Learn Ruby

1. Start server --> bin/rails server
2. Open browser --> localhost:3000

3. To get started saying "hello", you need to create at minimum a:
   a. route
   b. controller with an action
   c. view
   (functionality: a ROUTE maps a request to the CONTROLLER, a CONTROLLER with an action, and a controller action performs the required request to prepare the data for the VIEW)

ROUTES : routes are the rules written in a ruby.
CONTROLLERS : they are Ruby classes
ACTIONS : these are controller's public methods are actions
VIEWS : they are the HTML templates mixed with ruby

# Set up routes

1. in the config/routes.rb file add
   get "/articles" to: 'articles#index"

2. generate a controller with skiping routes
   bin/rails g controller Articles index --skip-routes

# AutoLoading

1. ArticleController inherits the ApplicationController, bit we have not imported it from anywhere, because it have the feature of autoLoading.

2. Application classes and methods are available everywhere, we don't have to load anything under app with "require"

3. You only need "require" for two use cases:
   a. to load the files under the 'lib' directory.
   b. to gem dependencies that have "require: false" in the gemfile.

# MVC

MVC is a design pattern which divides the responsibilities of an application to make it easier to reason about.

1. Model:

- Model is the data layer.
- It is responsible for interacting with the database, with the feature of .
- It is responsible for validating the data.
- It is responsible for creating, reading, updating, and deleting the data.

2. View:

- View is the presentation layer.
- It is responsible for rendering the HTML.
- It is responsible for displaying the data.
- It is responsible for taking the data from the model and converting it into HTML.

3. Controller:

- Controller is the business logic layer.
- It is responsible for receiving the request from the user.
- It is responsible for calling the model to get the data.
- It is responsible for calling the view to render the HTML.
- It is responsible for handling the request and returning the response.

# Generating a Modal

1. generate the modal:
   bin/rails g model Article title:string body:text
   Explanation:
   a. g - generate
   b. model - generate a model
   c. Article - the name of the model
   d. title:string - the name of the attribute and the type of the attribute (string)
   e. body:text - the name of the attribute and the type of the attribute (text)
