## libroot-swift

Swift interface-only wrapper for https://github.com/opa334/libroot

This repository is the source for `libroot.swiftmodule` in https://github.com/theos/headers

To create the swiftmodule from this repo, run `sh make.sh`

Concept on creating a swiftmodule thanks to https://railsware.com/blog/creation-of-pure-swift-module/#Loggerswiftmodule

### Interface

The primary purpose of this repo is to expose two functions in Swift to match the macros `libroot.h` provides for C and Obj-C.

`libroot.h` provides:

```objc
#define JBROOT_PATH_NSSTRING(path)
#define ROOTFS_PATH_NSSTRING(path)
```

This repo provides:

```swift
public func jbRootPath<S: StringProtocol>(_ path: S) -> String
public func rootFsPath<S: StringProtocol>(_ path: S) -> String
```

### Development

This repo contains a `Package.swift`. It serves as a convenient way to open this repo in an development environment.
This repo is not meant to be used as a Swift Package, nor should artifacts from a swift build be distributed.
Instead, always export using `sh make.sh`.
