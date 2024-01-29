#!/bin/bash -e
if [ "${BUILD_TYPE}" != "assemble" -a "${BUILD_TYPE}" != "bundle" ]; then
    echo "Invalid build-type: " ${BUILD_TYPE}
    exit 1
fi

if [ -n "${KEYSTORE_CONTENT}" ]; then
    echo "Creating keystore from content"
    echo $KEYSTORE_CONTENT | base64 --decode > "keystore.jks"
fi

# If statement used to prevent annoying cp warnings about possible same directories/files
if [ diff -r -q $PWD $ACTION_PATH != 0]; then
  cp -r ${ACTION_PATH}/fastlane ./
  cp ${ACTION_PATH}/Gemfile ./
fi

bundle add fastlane
bundle install

if [ -n "${FASTLANE_ENV}" ]; then
    echo "Running fastlane with environment: ${FASTLANE_ENV}"
    bundle exec fastlane --env ${FASTLANE_ENV} android $BUILD_TYPE
else
    echo "Running fastlane"
    bundle exec fastlane android $BUILD_TYPE
fi