# Query-Reply Protocol (QRP)
The web-based bitWeav client, Weav, uses an RPC protocol wherein nodes exchange messages, which are either queries or replies. All messages are encoded as **BEncode maps**, where the key identifies the type of message (**'q' for query, 'r' for reply**) and the corresponding value is a dictionary containing the bulk of the message. 

This dictionary is different for queries and replies. Nodes send queries to other nodes and either do expect a reply (e.g. pull requests) or don't (e.g. updates). As messages can be delivered out-of-order, we assign a unique transaction ID to each message to identify replies. **The transaction ID is an integer identified by the key 'i'**.

We also assign a version field to each message, which indicates the minimum version of the client required to correctly process the message. **The version field is a string with key 'v'**.  

## Queries
For a query, there will be an **'m' field, which identifies the procedure being called** and a **'p' field, which maps to a dict of parameters for the procedure**. 

## Replies
For a reply, there will be a **'v' field, which maps to a list of return values**. 

## Implementation
We implement the following structures on top of the client node:
* register(name, func) - to register a service on the node
* services - a dictionary of service name to functions. The function takes two parameters, message (which contains the sender, the ID, the version and a helper function _reply_) and args (which are the arguments passed to the function from the remote node)
* connect(address) - a generic function that connects via WebRTC DataChannels to a node and returns a Node object representing them

On top of the Node object we implement the following:
* query(name, args) - sends a query to the node for the mapped function _name_ supplied with _args_ 
* pending - a dictionary of query message IDs to 
* onmessage(message) - processes any new messages. For a query it runs the relevant function. For a reply it looks up the id
