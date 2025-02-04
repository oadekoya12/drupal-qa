# Drupal QA Testing Project

## Project Overview
This project is designed to set up an environment for testing and developing a Drupal website. It includes services for Drupal, a MariaDB database, PHPMyAdmin for database management, Elasticsearch for search functionality, an Angular front-end, and Allure Report for displaying test results. The primary focus is on ensuring excellence through automated and manual QA testing for Drupal projects.

## Project Structure
    ```Tree
    drupal-qa-testing/ 
    ├── Dockerfile 
    ├── docker-compose.yml
    ├── script.sh
    ├── drupal/
    ├── settings/
    │   └── settings.php
    ├── optinclude/
    │   └── compinstall.sh
    ├── tests/
    │   └── example.spec.js
    ├── playwright.config.js
    └── LICENSE

    ```

### Services
- **Drupal:** A CMS platform for building and managing websites.
- **MariaDB:** A relational database management system.
- **PHPMyAdmin:** A web-based database management tool for MariaDB.
- **Elasticsearch:** A search and analytics engine.
- **Playwright:** Automated testing framework.
- **Allure Report:** Framework for test result reporting.
- **Angular Front-end:** Front-end framework for building user interfaces.

### Getting Started
#### Prerequisites
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

#### Setup Instructions
1. **Clone the repository:**
   ```sh
   git clone <your-repository-url> drupal-qa-testing
   cd drupal-qa-testing
   ```
2. **Make the script executable:**
    ```sh
    chmod +x script.sh
    ```
3. **Run the setup script:**
    ```sh
    ./script.sh
    ```
    - **To build without using the cache, run:**
    ```sh
    ./script.sh --no-cache
    ```
### Accessing Services
- Drupal: Visit http://localhost:8950
- PHPMyAdmin: Visit http://localhost:8948
- MariaDB: Available on port 8949
- Elasticsearch: Visit http://localhost:8947
- Angular Front-end: Visit http://localhost:8951
- Allure Report: Visit http://localhost:8952

### Environment Variables
The environment variables are defined in the docker-compose.yml file:
- **Drupal Service:**
- DRUPAL_DB_HOST=db
- DRUPAL_DB_NAME=drupal
- DRUPAL_DB_USER=drupal
- DRUPAL_DB_PASSWORD=drupal
- ELASTICSEARCH_HOST=elasticsearch
- ELASTICSEARCH_PORT=9200

- **MariaDB Service:**
- MYSQL_ROOT_PASSWORD=rootpassword
- MYSQL_DATABASE=drupal
- MYSQL_USER=drupal
- MYSQL_PASSWORD=drupal

- **phpMyAdmin Service:**
- PMA_HOST=db
- PMA_USER=drupal
- PMA_PASSWORD=drupal

### Running Tests
- Automated Tests: Set up and run Playwright tests for various scenarios.
    - **Run Playwright Tests:**
    ```sh
    docker exec -it drupal-qa-testing npx playwright test
    ```
    - **Generate Allure Reports:**
    ```sh
    npx allure generate allure-results --clean -o allure-report
    ```
- Manual Tests: Perform manual testing for user registration, content creation, user role management, form validation, and accessibility.

## Contribution Guidelines
If you wish to contribute to this project, please follow these guidelines:
- Fork the repository.
- Create a new branch for your feature or bugfix.
- Commit your changes and push to the branch.
- Submit a pull request with a detailed description of your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
```plaintext
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Acknowledgments
Special thanks to the Drupal community for their continuous support and contributions.