// playwright.config.js
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests',
  timeout: 30000,
  retries: 2,
  reporter: [['list'], ['json', { outputFile: 'results.json' }]],
  use: {
    baseURL: 'http://drupal-qa-testing:80',  // Update this URL to the correct Drupal service URL
  },
});
