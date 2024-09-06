---
layout: post
title: "`Expected string or block string, but it was malformed` when posting a comment to GitHub through GraphQL"
date: 2024-09-06
tags: 
---

I had a GitHub Action that commented on Discussion posts if they had a specific label attached to them that stopped working suddenly this week.
This was done through a Ruby script that is called by the GitHub Action.

I did some troubleshooting and ended up printing out the response from the graphQL query and I saw this error:

```
@response_body="{
                  "errors":
                    [
                      {
                        "message":"Expected string or block string, but it was malformed",
                        "locations":[
                          {
                            "line":4,
                            "column":13
                          }
                        ]
                      }
                    ]
                  }"
```

It turns out that I was sending a multi line string as the comment body but had it wrapped in one double quote.
The fix was to wrap the multi line string in _three_ double quotes, like this:

```
mutation {
  addDiscussionComment(
    input: {
      body: """#{body}""",
      discussionId: "#{self.id}",
      clientMutationId: "rubyGraphQL"
    }
  ) {
    clientMutationId
    comment {
       id
       body
    }
  }
}
```
