#include <stdio.h>
#include "bogart.h"

Bogart {
    UseRedis;
    //Model(User, "name", "email");

    get("/hello") {
        body("<h1>Hello, World!</h1>");
    };
    
    get("/create") {
        redisCommand(_redisCtx, "HSET User:%s %s %s", params("id"), "name", params("name"));
        body("User created.");
    };

    get("/show") {
        redisReply * reply = redisCommand(_redisCtx, "HGET User:%s %s", params("id"), "name");
        view("index.cml", map("name", reply->str));
    };

    Start(11000)
}
