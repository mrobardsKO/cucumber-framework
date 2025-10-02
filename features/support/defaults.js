require("dotenv").config();

const { Before } = require("@cucumber/cucumber");
const { handler, request, settings } = require("pactum");
const { faker } = require("@faker-js/faker");

handler.addDataFuncHandler("faker", (ctx) => {
  const [path, ...args] = ctx.args, parts = path.split(".");

  const fn = parts.reduce((acc, part) => acc?.[part], faker);

  if (typeof fn !== "function") {
    throw new Error(`Invalid faker method path: ${path}`);
  }

  return fn(...args);
});

Before(() => {
  request.setDefaultTimeout(15 * 1000);
  settings.setReporterAutoRun(false);
});
