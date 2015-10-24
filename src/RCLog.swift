//
//  RCLog.swift
//
//  Created by Baluta Cristian on 12/08/2014.
//  Copyright (c) 2014 Baluta Cristian. All rights reserved.
//

import Foundation
import CoreGraphics

private var tracesDisabled = false
private var allowedClasses = [String]()
private var lastTracedMethod = ""

func RCLog (item: Any, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	traceFile(file, methodName: function, line: line, message: "\(item)")
}

func RCLogO (message: AnyObject?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	traceFile(file, methodName: function, line: line, message: "\(message)")
}

func RCLogErrorO (message: AnyObject?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	if message != nil {
		print("**ERROR: \((file as NSString).lastPathComponent):\(line): \(message)")
	}
}

func RCLogI (message: Int?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	print("\((file as NSString).lastPathComponent):\(line): \(message)")
}

func RCLogF (message: Float?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	print("\((file as NSString).lastPathComponent):\(line): \(message)")
}

func RCLogRect (message: CGRect?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	if message != nil {
		print("\((file as NSString).lastPathComponent):\(line): CGRect\(message!)")
	} else {
		print("\((file as NSString).lastPathComponent):\(line): \(message)")
	}
}

func RCLogSize (message: CGSize?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	print("\((file as NSString).lastPathComponent):\(line): \(message)")
}

func RCLogPoint (message: CGPoint?, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	print("\((file as NSString).lastPathComponent):\(line): \(message)")
}

func RCLogThread (file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
	let message = NSThread.isMainThread() ? "Log from Main Thread" : "Log from Secondary Thread"
	print("\((file as NSString).lastPathComponent):\(line): \(message)")
}


// MARK: 
private func traceFile(file: String, methodName: String, line: Int, message: String) {
	
	if !tracesDisabled {
		if allowedClasses.count == 0 {
			_traceFile(file, methodName: methodName, line: line, message: message)
		}
		else {
	//		for (c in allowedClasses) {
	//			if (c == (file as NSString).lastPathComponent  [file componentsSeparatedByString:@"."] firstObject]]) {
	//				_traceFile(file, methodName: methodName, line: line, message: message)
	//			}
	//		}
		}
	}
}

private func _traceFile(file: String, methodName: String, line: Int, message: String) {
	let className = (file as NSString).lastPathComponent
	let prefix = lastTracedMethod == methodName ? className : "\n\(className):\(methodName)\n\(className)"
	print("\(prefix):\(line): \(message)")
    lastTracedMethod = methodName;
}

func disableTraces() {
	tracesDisabled = true
}

/**!
 *  Chose the classes you want to see the traces from
 *  @param arr is an array of strings that represent the file names.
 *  Call this method as many times as you like.
 *  If you don't specify any all traces are sent to the output
 **/
func allowClasses(arr: Array<String>) {
//    allowedClasses.append(arr)
}