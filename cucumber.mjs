import * as process from "process";
import * as os from "os";

export default {
  format: ["allure-cucumberjs/reporter"],
  formatOptions: {
    resultsDir: "allure-results",
    labels: [
      {
        pattern: [/@epic:(.*)/],
        name: "epic",
      },
      {
        pattern: [/@severity:(.*)/],
        name: "severity",
      },
    ],
    links: {
      issue: {
        pattern: [/@issue:(.*)/],
        urlTemplate: "https://issues.example.com/%s",
        nameTemplate: "ISSUE %s",
      },
      tms: {
        pattern: [/@tms:(.*)/],
        urlTemplate: "https://tms.example.com/%s",
      },
      jira: {
        pattern: [/@jira:(.*)/],
        urlTemplate: (v) => `https://jira.example.com/browse/${v}`,
      }
    },
    environmentInfo: {
      os_platform: os.platform(),
      os_release: os.release(),
      os_version: os.version(),
      node_version: process.version,
    },
  },
};
