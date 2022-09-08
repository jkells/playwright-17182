import { test, expect } from "@playwright/test";

test.use({ storageState: "storage.json" });

test("failing test", async ({ page }) => {
    await page.goto("https://demo.playwright.dev/todomvc");
    expect(await page.evaluate("localStorage.foobar")).toBe("qux");
});
