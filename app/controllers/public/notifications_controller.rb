class Public::NotificationsController < ApplicationController

  def index
    if params[:filter] == "unchecked"
      @notifications = current_member.passive_notifications.where(checked: false)
    else
      @notifications = current_member.passive_notifications
    end
  end

  def show
    @notification = Notification.find(params[:id])
    @comment = @notification.comment
    @post = @notification.post
    @notification.update(checked: true) #詳細画面を開くと通知が既読になる
  end

  def recheck
    @notification = Notification.find(params[:id])
    @notification.update(checked: !@notification.checked)
    redirect_to request.referer
  end

end
