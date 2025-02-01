// playwright.config.js
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests',
  retries: 2,
  use: {
    browserName: 'chromium',
    headless: true,
    baseURL: 'http://localhost:80',  // Using internal container port
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
    outputDir: '/opt/test-results',  // Specify output directory for test results
  },
});
