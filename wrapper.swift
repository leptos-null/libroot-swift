import Foundation

@_alwaysEmitIntoClient
public func jbRootPath(_ cPath: UnsafePointer<CChar>?) -> String {
    let stringElements: [String.Element] = .init(unsafeUninitializedCapacity: Int(PATH_MAX)) { buffer, initializedCount in
        if let resolved = libroot_dyn_jbrootpath(cPath, buffer.baseAddress) {
            initializedCount = strlen(resolved)
        } else {
            initializedCount = 0
        }
    }
    return String(stringElements)
}

// https://www.fivestars.blog/articles/disfavoredOverload/
@_alwaysEmitIntoClient
@_disfavoredOverload
public func jbRootPath<S: StringProtocol>(_ path: S) -> String {
    path.withCString { cPath in
        jbRootPath(cPath)
    }
}

@_alwaysEmitIntoClient
public func rootFsPath(_ cPath: UnsafePointer<CChar>?) -> String {
    let stringElements: [String.Element] = .init(unsafeUninitializedCapacity: Int(PATH_MAX)) { buffer, initializedCount in
        if let resolved = libroot_dyn_rootfspath(cPath, buffer.baseAddress) {
            initializedCount = strlen(resolved)
        } else {
            initializedCount = 0
        }
    }
    return String(stringElements)
}

// https://www.fivestars.blog/articles/disfavoredOverload/
@_alwaysEmitIntoClient
@_disfavoredOverload
public func rootFsPath<S: StringProtocol>(_ path: S) -> String {
    path.withCString { cPath in
        rootFsPath(cPath)
    }
}
