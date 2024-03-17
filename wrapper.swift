import Foundation

@_alwaysEmitIntoClient
public func jbRootPath(_ cPath: UnsafePointer<CChar>?) -> String {
    guard let resolved = libroot_dyn_jbrootpath(cPath, nil) else { return "" }
    let result = String(cString: resolved)
    free(resolved)
    return result
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
    guard let resolved = libroot_dyn_rootfspath(cPath, nil) else { return "" }
    let result = String(cString: resolved)
    free(resolved)
    return result
}

// https://www.fivestars.blog/articles/disfavoredOverload/
@_alwaysEmitIntoClient
@_disfavoredOverload
public func rootFsPath<S: StringProtocol>(_ path: S) -> String {
    path.withCString { cPath in
        rootFsPath(cPath)
    }
}
