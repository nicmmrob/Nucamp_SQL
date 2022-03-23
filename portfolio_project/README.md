### Plant Shop Database
# This is my portfolio project for Nucamp's SQL with Python.
# Throughout this project, I utilized several tools including but not limited to: postgres, docker, pgAdmin, flask, insomnia, and much more.

| :---               |                           :----: |
| Property           |                      Description |
| URL                |     http://localhost:5000/plants |
| Method             |                              GET |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |


| :---               |                           :----: |
| Property           |                      Description |
| URL                |     http://localhost:5000/plants |
| Method             |                             POST |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |
| Content/Media-Type |                 application/json |


| :---               |                           :----: |
| Property           |                      Description |
| URL                |   http://localhost:5000/plants/1 |
| Method             |                              PUT |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |
| Content/Media-Type |                 application/json |


| :---               |                           :----: |
| Property           |                      Description |
| URL                |   http://localhost:5000/plants/5 |
| Method             |                           DELETE |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |


| :---               |                           :----: |
| Property           |                      Description |
| URL                |  http://localhost:5000/customers |
| Method             |                              GET |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |


| :---               |                           :----: |
| Property           |                      Description |
| URL                |  http://localhost:5000/customers |
| Method             |                             POST |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |
| Content/Media-Type |                 application/json |

| :---               |                           :----: |
| Property           |                      Description |
| URL                |http://localhost:5000/customers/5 |
| Method             |                              PUT |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |
| Content/Media-Type |                 application/json |

| :---               |                           :----: |
| Property           |                      Description |
| URL                |http://localhost:5000/customers/5 |
| Method             |                           DELETE |
| Success            |                  Http status 200 |
| Failure            |              Http status 400/500 |
| Content/Media-Type |                 application/json |

# I implemented POST, GET, PUT, and DELETE. I had two files, one for customers and the other for plants. I have a POST statement to create a new plant in the database, GET a plant by ID, PUT which is to update the price of a plant, and DELETE a plant altogether.

# Most of the same is true for customers, except you can update first and last name.

# I chose to go with the ORM. I really wanted to get more familiar with the process and it was easier for me to duplicate steps from the workshop and really get to know the "why."

# I could implement much more features like listing out the number of plants, changing the email for the customer, etc.