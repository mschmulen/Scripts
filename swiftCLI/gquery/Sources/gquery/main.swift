
import Foundation
import Commander

import Apollo

let production = URL(string: "https://gapi.learnwithhomer.com/graphql")!
let staging = URL(string: "https://gapi-staging.learnwithhomer.com/graphql")!

let apolloClient: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    // Add additional headers as needed
//    configuration.httpAdditionalHeaders = ["Authorization": "Bearer <token>"] // Replace `<token>`


    return ApolloClient(networkTransport: HTTPNetworkTransport(url: production, configuration: configuration))
}()

let gqlQueryString = """
yack
"""

//query HeroName($episode: Episode) {
//    hero(episode: $episode) {
//        name
//    }
//}


let commandGroup = Group {

    $0.command("simple") {
        print("simple \(production.absoluteURL)")
        let apollo = ApolloClient(url: production)
        print ( "\(apollo)")

//        let q = GraphQLQuery()
//        apollo.fetch(query: GraphQLQuery.Data)

        //        let query = GraphQLQuery()
//        apollo.fetch(query: query)
    }

    $0.command("upgrade") { (name:String) in
        print("Updating \(name)")
    }

    $0.command("fetch",
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


//private let graphQLClient: ApolloClient

