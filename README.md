# fastlane-build-apps

Builds Android and iOS projects using Fastlane

**This project is in its early stages, it should not be relied upon until (or if) it hits version 1.x.x+**

Note: make sure the value of the `keystore-content` you pass in is base-64 encoded.
To do this, run:
`openssl base64 -in <PATH_TO_UNENCODED_FILE> -out <OUTPUT_PATH_FOR_ENCODED>`
`openssl base64 < <PATH_TO_UNENCODED_FILE> | tr -d '\n' | pbcopy`

This copies the base-64 encoded keystore to your clipboard without any of the newline characters.

## Locally Testing Action Using `act`

There's an `.actrc` file in the root dir that passes in the following default options to `act`:

- `--container-architecture linux/amd64`: only necessary if you're running on an M1+ Mac chip
- `--eventpath testing/event.json`: passes in a path to a JSON file that simulates GitHub events, in this case it sets `github.event.act` to `true`, which is used in a workflow step to determine whether or not the Android SDK should be installed (it's installed by default on IRL GitHub runners, but not in `act`)

```bash
act -j <JOB_NAME_TO_RUN> --secret-file .env-test-action --container-architecture linux/amd64
```

Example:

```bash
act -j test-android-bundle-release --secret-file .env-test-action --container-architecture linux/amd64
```

### Setup

The _.env-test-action_ file should contain the env vars `KEYSTORE_CONTENT`, `KEYSTORE_PASSWORD`, `KEYSTORE_ALIAS`

A folder containing an Android project to test, referenced by the `project-path` variable
