# karate-deckofcards
[Deck Of Cards API](https://deckofcardsapi.com/) testing using Karate

## Author fcresgam - Felipe Crespo Gambade
- Felipe Crespo Gambade
    - Mail: [felipecrespo@pm.me](mailto:felipecrespo@pm.me) ([felipecrespo@protonmail.com](mailto:felipecrespo@protonmail.com))
    - Resume: [fecresgam](https://github.com/fecresgam/felipe-crespo-resume)
    - GitHub: [fecresgam](https://github.com/fecresgam)

## Instructions to run test with maven
- Run All Karate tests: `mvn clean test`
- Run by category
  - Contract tests: `mvn clean test -Dkarate.options="--tags @contract"`
  - Component tests: `mvn clean test -Dkarate.options="--tags @component"`
- Filtering by bug
  - All non-fixed issues: `mvn clean test -Dkarate.options="--tags @openissue"`
  - All but non-fixed issues: `mvn clean test -Dkarate.options="--tags ~@openissue"`
  - Issue number X: `mvn clean test -Dkarate.options="--tags @issueX"`


## Check Runs Results
Take a look on last runs on [GitHub Actions](https://github.com/fecresgam/karate-deckofcards/actions)
Inside every run you will find an "Artifacts" section where you can find:
- The karate results html report.
- The OWASP ZAP security-related found issues. 

## About Deck Of Cards
[GitHub Repo](https://github.com/crobertsbmw/deckofcards)
[Documentation](https://deckofcardsapi.com/)
