library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github","6f92beabebd0b75d89c9","45458ab22f0781f99fb310fb940e38f1294bee85")

  # 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
save content(req)


# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
sink('analysis-output.txt')
content(req)
sink()
saveRDS(content(req), file="test.R")

#
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
req

library(plyr) 
req.df = ldply(req, function(t) t$toDataFrame())
lapply(content(req), write, "test.txt", append=TRUE, ncolumns=1000)
