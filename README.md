# README

You can see app deployed on heroku here: https://complexform.herokuapp.com/

**IMPORTANT**

*Zip code for Poland is not correctly validated due to error in regex in gem*

https://github.com/dgilperez/validates_zipcode/blob/master/docs/postalCodeData.xml


## General info

* Recruitment task for Chimera Prime. Goal is to build complex form and related datamodel.

* Usage of gems and TDD is recommended

* Technologies(gems) used
  - database=postgresql
  - rspec - testing framework
  - simple_form - form framework
  - bootstrap 4 - front
  - heroku - for deploy
  - slim - templating language
  - phonelib - validations of phone numbers
  - validates_zipcode - validations of zip code depending on the country

## Setup

1. Write in terminal

`git clone https://github.com/PiotrWald/ComplexForm`

2. Inside ComplexForm direcotry run

`bundle install`

3. Next

`rails db:migrate`

4. Finally start the rails server

`rails s`

5. Visit in your brwoser

`http://localhost:3000/`
