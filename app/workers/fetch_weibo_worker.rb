class FetchWeiboWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform()
    target = Target.first
    client = WeiboOAuth2::Client.new
    client.access_token = WeiboOAuth2::AccessToken.new client, target.user.wb_token

    resp = client.statuses.home_timeline access_token: target.user.wb_token, count: 100, trim_user: 1
    # see doc for meaning of params: http://open.weibo.com/wiki/2/statuses/home_timeline
    return unless resp.present? && resp.statuses.present?
    resp.statuses.inject(Array.new) do |array, status|
      if status.uid.to_s == target.wb_uid
        array.push({ id: status.id, text: status.text })
      else
        array
      end
    end
  end
end
