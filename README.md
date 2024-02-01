# fastlane-build-apps

Builds Android and iOS projects using Fastlane

**This project is in its early stages, it should not be relied upon until (or if) it hits version 1.x.x+**

## Locally Testing Action Using `act`

`--container-architecture linux/amd64` is only necessary if you're running on an M1+ Mac chip

```bash
act -j run-my-action --secret-file .env-test-action --container-architecture linux/amd64
```

### Setup

The _.env-test-action_ file should contain the env vars `KEYSTORE_CONTENT`, `KEYSTORE_PASSWORD`, `KEYSTORE_ALIAS`

A folder containing an Android project to test, referenced by the `project-path` variable
