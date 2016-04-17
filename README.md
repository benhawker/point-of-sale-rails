Point of Sale Rails - April 2016
===================
A Rails 4.2 app acting as Point of Sale interface that makes heavy use of AJAX for faster page reloading. Built for learning purposes to develop experience with Turbolinks. Very minimal specs included :( as the purpose was AJAX/Turbolinks.

View the app at: Heroku URL to follow.

```
Key functionality includes the ability to:
- Create Categories & Products (only available as an Admin User)
- Create Customers & Orders
- Show the Order/Order Items - with associated details.
```

- Note: No user authentication added at this stage so the Admin section is open to all users. A simple extension adding Devise would easy to manage given the existing namespacing between Admin and Regular user routes.


Setup:
-------
```
git clone [url of repo]
bundle
bin/rake db:create
bin/rake db:migrate
bin/rails s
```

Extensions:
-------

- Styling
  -  Some CSS that adds some actual 'style' would be a bonus.
  -  The CSS is not organised well at all (this was not my focus).

- Specs (always good to have!)

- I have an Invoice class and intend to add to this project to allow the creation of a PDF Invoice (making use of https://github.com/mileszs/wicked_pdf).




