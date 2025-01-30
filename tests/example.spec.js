// tests/example.spec.js
const { test, expect } = require('@playwright/test');

test('homepage has title', async ({ page }) => {
  await page.goto('/');
  await expect(page).toHaveTitle('drupal');
});
