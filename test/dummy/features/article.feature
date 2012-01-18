Feature: Create and manage articles
  In order to make an internet article
  As an author
  I want to create and manage some articles

  Scenario: Go to the articles admin site
    Given that a confirmed admin exists
    And I am logged in as "admin@test.de" with password "secure12"
    Given the following "articles" exist:
      | title                        |
      | "10 Internet Marketing Tips" |
      | "Top 10 Internet Marketers"  |
    When I go to the admin list of articles
    Then I should see "10 Internet Marketing Tips"
    And I should see "Top 10 Internet Marketers" within ".index_content"
    And I should not see "Dies ist kein Artikel"

  Scenario: Create a new Article
    Given that a confirmed admin exists
    And I am logged in as "admin@test.de" with password "secure12"
    And I am on the admin list of articles
    When I click on "New Article"
    Then I should see "New Article"
    When I fill in "article_title" with "Dies ist ein Neuer Artikel"
    And I fill in "article_url_name" with "dies ist kurz"
    And I press "Create Article"
    Then I should see "Dies ist ein Neuer Artikel" within "table"
    And I should see "dies-ist-kurz" within "table"
    
  Scenario: Visit new Article in frontend
    Given that I am not logged in
    And an article exists with the following attributes:
      |title| "Dies ist ein Test"|
      |url_name| "Kurzer Titel"|
      |teaser| "Es war einmal..."|
      |content| "Die kleine Maus wandert um den Käse..."|
    Then I go to the article page "kurzer-titel"
    And I should see "Dies ist ein Test" within "h1"
    And I should see "Die kleine Maus wandert um den Käse..." within "#article_content"

  Scenario: mark a Page as startpage
    Given that a confirmed admin exists
    And I am logged in as "admin@test.de" with password "secure12"
    And the following "articles" exist:
      | title                        | startpage | id |
      | "10 Internet Marketing Tips" | false     |  2 |
      | "Startseite"                 | false     |  3 |
    When I go to the admin list of articles  
    Then I click on "View" within "tr#article_3"
    And I should see "Article #3" within "#page_title"
    And I should see "Make this article Startpage"
    When I click on "Make this article Startpage" within "#startpage_options_sidebar_section"
    Then I should see "This Article is the Startpage!"

  Scenario: Visit the startpage 
    Given that I am not logged in
    And an startarticle exists
    Then I go to the startpage
    And I should see "Startseite" within "h1"

  
  
      
    
    