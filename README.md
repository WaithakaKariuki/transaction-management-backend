# Transaction Management Backend 

A backend app that allows the recording of financial transactions and viewing the transaction history.

It should implement the [Transaction Management API specification](https://infra.devskills.app/transaction-management/api/3.1.0), which is defined in the [Open API](https://www.openapis.org/) format.

It is built in Ruby on Rails.

## Additional requirements

- All [provided E2E tests](cypress/e2e/test.cy.js) pass.
- Utilizes [SQLite](https://www.sqlite.org/index.html) database. 
- Avoids duplication and extract re-usable modules where it makes sense. Has an easy to maintain codebase.

## Getting started

<details>
  <summary>Import a starter project</summary>

  To import a starter project:

  1. Go to the "Actions" tab of your GitHub repository and select the "Setup boilerplate" workflow in the left side panel.
  2. In the "Run workflow" dropdown, select the desired boilerplate along with the branch name where you want the boilerplate to be imported (e.g., `implementation`) and click the "Run workflow" button (you can find all starter projects' definitions [here](https://help.alvalabs.io/en/articles/7972852-supported-coding-test-boilerplates)).

  After the workflow has finished, your selected boilerplate will be imported to the specified branch, and you can continue from there.

  > ⚠️ **Custom setup**
  > 
  > If you instead want to set up a custom project, complete the steps below to make the E2E tests run correctly:
  > 1. Update the `baseUrl` (where your frontend runs) in [cypress.config.js](cypress.config.js).
  > 2. Update the [`build`](package.json#L5) and [`start`](package.json#L6) scripts in [package.json](package.json) to respectively build and start your app.
  
</details>

<details>
  <summary>Prepare for coding</summary>

  To get this repository to your local machine, clone it with `git clone`.

  Alternatively, spin up a pre-configured in-browser IDE by clicking on the "Code" tab in this repository and then "Create codespace on {branch_name}".

  ![CleanShot 2023-10-13 at 00 00 32@2x](https://github.com/DevSkillsHQ/transaction-management-fullstack-level-1/assets/1162212/598ff1ae-238d-4691-8b7c-eb2228fdefac)

</details>

<details>
  <summary>Running the E2E tests</summary>

  > ⚠️ Before executing the tests, ensure [Node](https://nodejs.org/en) is installed and your app is running.
  ```bash
  npm install
  npm run test
  ```

</details>

## Time estimate

Between 2 - 3 hours + the time to set up the project/environment.

