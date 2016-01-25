class FetchWeiboWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform()
    target = Target.first
    client = WeiboOAuth2::Client.new
    client.access_token = WeiboOAuth2::AccessToken.new client, target.user.wb_token

    resp = client.statuses.home_timeline access_token: target.user.wb_token, count: 100
    # see doc for meaning of params: http://open.weibo.com/wiki/2/statuses/user_timeline
    printf resp.inspect
  end
end
