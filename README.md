# Todo list
&nbsp;
### Installation
   [postgresql](https://www.postgresql.org/) version 9+
 
   Ruby version 2.5.3
 
   Rails version 5.2.4
 
```sh
git clone git@github.com:jhonytaveira/todo_list.git
cd todo_list/
bundle install
```
>
> Configure database.yml with your credentials. You can use database.sample.yml as example
>
```sh
rake db:create
rake db:migrate
```

```sh
rails s
```
>
>Access localhost from google chrome browser   http://localhost:3000
>
&nbsp;
&nbsp;

# running rubocop
  ```sh
rubocop
```
&nbsp;
&nbsp;

# running tests

>
> https://chromedriver.chromium.org/downloads For test features, you must install chromedriver and compatible chrome version
> 
>

```sh
rspec spec/
```
