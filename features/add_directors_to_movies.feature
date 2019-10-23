Feature: search for movies by director

  Test for add, edit, and remove movies

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | test         | PG     | test         |   2000-01-08 |
  | test1        | PG     | test         |   1987-07-24 |
  | test2        | R      |              |   2004-12-23 |
  | test123      | R      | old          |   1973-04-05 |
  | test4        | R      | old2         |   1967-08-13 |

Scenario: add a new movie
  Given I am on the new movie page
  And   I fill in "Title" with "new test"
  And   I fill in "Director" with "new"
  And   I select "PG" from "Rating"
  And   I press "Save"
  Then  I should be on the movies page
  When  I am on the details page for "new test"
  Then  I should see "new test"
  Then  I should see "PG"
  Then  I should see "new"
  
Scenario: find movie with same director
  Given I am on the details page for "test"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "test"
  And   I should see "test1"
  But   I should not see "test123"
  
Scenario: delete existing movie
  When I am on the details page for "test4"
  And  I press "Delete"
  Then I should see "Movie 'test4' deleted"
  And I should not see "old2"