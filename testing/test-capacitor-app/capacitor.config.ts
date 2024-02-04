import { CapacitorConfig } from "@capacitor/cli";

const config: CapacitorConfig = {
  appId: "io.ionic.starter",
  appName: "test-capacitor-app",
  webDir: "dist",
  server: {
    androidScheme: "https",
  },
  ios: {
    path: "ios",
  },
  android: {
    path: "android",
  },
};

export default config;
