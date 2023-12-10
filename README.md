# Learn Ruby

1. Start server --> `bin/rails server`
2. Open browser --> `localhost:3000`

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
   `get "/articles" to: 'articles#index"`

2. generate a controller with skiping routes
   `bin/rails g controller Articles index --skip-routes`

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
   `bin/rails g model Article title:string body:text `
   Explanation:
   a. g - generate
   b. model - generate a model
   c. Article - the name of the model [model name is singular, because it represents the singular data record]
   d. title:string - the name of the attribute and the type of the attribute (string)
   e. body:text - the name of the attribute and the type of the attribute (text)

2. here, 2 types of the files will be created
   a. migrate file --> `db/migrate/<timestamp>\_create_articles.rb`
   example: db/migrate/20231210142212_create_articles.rb

   b. model file --> `app/models/article.rb`

Note: if you check your server here after creating model but before migrating, you will get an error, stating : "Pending Migration Error"
--> this will tell you to migrate the model

# Migrating Database

1. to migrate the database, you need to run the following command
   `bin/rails db:migrate`
2. Migration is used for altering the structure of the application's database.

Note: now the application is running fine because of the database is migrated successfully

# fileStructure for the newly created migrated file

1. inside create_table, there are two columns are defined: title and body. These were added by the generator because we included them in out generate model command which was (bin/rails generate model title:string body:text)
2. in the last line "t.timestamps" is created automatically, which defines two additional columns --> "created_at" and "updated_at"
3. Rails will manage creation and updation of timestamps for you.

# Using a Model to interact with the database

1. add console in the rails, this will let the application code loads automatically.
   `bin/rails console`
2. this command will show interactive coding environments
   a. Creating a new Article
   `article = Article.create(title: "Hello World", body: "This is my first article")`
   note: we only have to initialize this object. This is not saved to database it is just for the console, so that we can experiment with the data.

   b. Saving an article -- to save the object in the database we need to use:
   `article.save`

   c. see the article in database:
   `article`

   d. see the particular entry in the database
   `Article.find(1)` // here the user will get the first element of the table Article

# List of Articles

1. To fetch all the actions from the database.
2. In the article_controller.rb file `@article = Article.all` means, we can reference in `app/views/articles/index.html.erb`
3. You can access the @article anywhere in the app folder, without importing it again and again
4. you can use the `@articles` in `app/views/articles/index.html.erb` file, This would be coming from the 'article controller file'

   ```
   <ul>
        <% @articles.each do |article| %>
           <li>
               <%= article.title %>
           </li>
       <% end %>
   </ul>
   ```

5. <% %> and <%= %>, are the ERB which is a templating system that evaluates Ruby code in the document.

   1. <% %> is for loop and other conditional statement.
   2. <%= %> is for outputing the returned values.

# CRUD with rails

## Showing a single article

1.
