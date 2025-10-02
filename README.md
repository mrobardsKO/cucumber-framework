# cucumber-framework
A framework for using cucumber.js and pactum.js.

## Prerequisites
- Git
- [Bun](https://bun.sh/) 1.0 or newer (adds `bun` and `bunx` to your PATH)

## Getting Started
1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd cucumber-framework
   ```
2. Install dependencies with Bun:
   ```bash
   bun install
   ```
3. Create your environment file by copying the template and filling in real values (especially `PACTUM_REQUEST_TOKEN`):
   ```bash
   cp env.example .env           # macOS/Linux
   Copy-Item env.example .env    # Windows PowerShell
   ```

## Running Cucumber Tests
Execute the feature suite with the bundled configuration:
```bash
bun cucumber-js --config cucumber.mjs
```
This writes execution artifacts to `allure-results/` for Allure reporting.

## Generating Allure Reports
Generate a static report:
```bash
bun x allure generate allure-results --clean --output allure-report
```
Open the generated report locally:
```bash
bun x allure open allure-report
```
Or run the live server variant, which rebuilds on changes:
```bash
bun x allure serve allure-results
```

## Updating Dependencies
If `package.json` or `bun.lock` change upstream, re-run `bun install` to stay in sync.
