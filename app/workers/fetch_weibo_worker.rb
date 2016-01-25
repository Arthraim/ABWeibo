class FetchWeiboWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    Target.find_each do |target|
      client = WeiboOAuth2::Client.new
      client.access_token = WeiboOAuth2::AccessToken.new client, target.user.wb_token

      resp = client.statuses.home_timeline access_token: target.user.wb_token, count: 100, trim_user: 1
      # see doc for meaning of params: http://open.weibo.com/wiki/2/statuses/home_timeline
      return unless resp.present? && resp.statuses.present?
      resp.statuses.each do |status|
        if status.uid.to_s == target.wb_uid
          Status.find_or_initialize_by(wb_sid: status.id) do |s|
            s.wb_uid = status.uid
            s.posted_at = status.created_at.to_datetime
            s.raw = status.to_json
          end.save
        end
      end
    end
  end
end
