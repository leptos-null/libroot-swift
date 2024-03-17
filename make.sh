#!/bin/sh

set -e

SOURCE_FILE="wrapper.swift"
MODULE_NAME="libroot"
SWIFT_FLAGS="-I${THEOS}/vendor/include"
SDK_PATH="$(xcrun --sdk iphoneos --show-sdk-path)"

SWIFT_MODULE="${MODULE_NAME}.swiftmodule"

# 1 : output directory
# 2 : triple
# 3 : target
function generate_swift_interface {
    # inspired by
    # https://railsware.com/blog/creation-of-pure-swift-module/#Loggerswiftmodule
    swiftc -enable-library-evolution \
        -target "${3}" \
        -sdk "${SDK_PATH}" \
        -emit-module-interface-path "${1}/${2}.swiftinterface" \
        -module-name "${MODULE_NAME}" \
        -import-underlying-module \
        -parse \
        -parse-as-library \
        ${SWIFT_FLAGS} \
        ${SOURCE_FILE}
}

if [ "${1}" = "clean" ]; then
    rm -r "${SWIFT_MODULE}"
    exit 0
fi

mkdir -p "${SWIFT_MODULE}"
generate_swift_interface "${SWIFT_MODULE}" 'armv7-apple-ios' 'armv7-apple-ios7.0'
generate_swift_interface "${SWIFT_MODULE}" 'arm64-apple-ios' 'arm64-apple-ios7.0'
generate_swift_interface "${SWIFT_MODULE}" 'arm64e-apple-ios' 'arm64e-apple-ios7.0'

exit 0
