import Commander



let commandGroup = Group {

    $0.command("install") {
        print("Installing Pods")
    }

    $0.command("upgrade") { (name:String) in
        print("Updating \(name)")
    }

    $0.command("download",
               Flag("web", description: "Searches on cocoapods.org"),
               Argument<String>("query"),
               description: "Perform a search"
    ) { web, query in
        if web {
            print("Searching for \(query) on the web.")
        } else {
            print("Locally searching for \(query).")
        }
    }
}
commandGroup.run()

//let main = command { (filename:String) in
//    print("Reading file \(filename)...")
//}

//let commandAudit = command(
//    Option("folder", default: "./", description: "folder to audit"),
//    Option("count", default: 1, description: "The number of times to print.")
//) { folder, count in
//
//    for _ in 0..<count {
//        print("folder: \(folder)")
//    }
//}
//commandAudit.run()

