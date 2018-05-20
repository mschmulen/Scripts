#!/usr/bin/swift

func fib(_ n:Int) -> Int {
	if n <= 2 {
		return 1
	}
	return fib(n-1) + fib(n-2)	
}

if let arg = Int(CommandLine.arguments[1]) {
	print( arg )
	print( fib(arg) )
} else {
	print( "Usage: fib<n>")
}

