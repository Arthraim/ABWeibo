这是一个写给朋友的 web app

他要关注一个人的微博，但是那个人经常删微博，一般发个两分钟就删了。因为没办法看到每一条，于是就希望有个爬虫能帮他一直缓存。

于是事情被我搞的复杂化了一点，我做了个微博登录的用户系统，然后每个用户可以关注一个微博好友，每分钟去抓一次这个好友。

后来……

1. user_timeline 不能抓别人的了，改从 home_timeline 里筛选
2. API 频率太高了
3. 微博 app 审核不通过，说是不符合他们的规定

于是就不了了之了。（本来打算改用个爬虫去页面爬的）

======

其实稍微改一改可以用在 twitter

======

怎么继续玩

1. clone
2. `bundle install`
3. `brew install postresql redis` （如果你没装过的话 -。-



## ENGLISH

This a app wrote for my friends.

He want to follow a friend's Weibo, but that guy often deletes his statuses very soon, usually 1,2 mintues after he posted. Since my friend is not able to see all statuses of the guy, he wish there would be a crawler to help him to cache everything.

So I made it a little bit more complex, I setup a user system based on Weibo's OAuth, and each user can "stalk" one weibo friend. Each minute app will fetch the data of the guy being followed.

Then...

1. `user_timeline` can't fetch other users' data (fuck WEIBO), switched to `home_timeline`
2. API frequency is too high (fuck WEIBO)
3. The verification of source app of Weibo got failed, cause the app violates their guidelines (fuck WEIBO)

So... nothing happens further.. (planned to fetch data directly from page with a small crawller)

======

How to hack

A very normal rails app.

1. clone
2. `bundle install`
3. `brew install postresql redis` if you haven't installed

